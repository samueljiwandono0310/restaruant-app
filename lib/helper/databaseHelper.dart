import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/model/user_model.dart';
import 'package:restaurant_app/model/user_reservation.dart';
import 'package:sqflite/sqflite.dart';

final String tableNameUser = "user_profile";
final String tableReservation = "reservation";

class DatabaseHelper {
  static Database _database;
  static DatabaseHelper _databaseHelper;
  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      print("get in fuction database");
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "restaurant.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableNameUser (
            id text primary key, 
            userName text not null,
            nickname text not null,
            dateOfBird text not null,
            gender text not null,
            address text not null,
            nationality text not null,
            password text not null)
        ''');

        db.execute('''
          create table $tableReservation (
            reservationId text primary key, 
            userId text not null,
            restauranId integer not null,
            seatNumber integer not null,
            reservationDate text not null)
        ''');
      },
    );
    return database;
  }

  void insertTableUser(UserModel userModel) async {
    var db = await this.database;
    var result = await db.insert(tableNameUser, userModel.toMap());
    print('insert tabel: $result');
  }

  void insertTableReservation(ReservationModel reservationModel) async {
    var db = await this.database;
    var result = await db.insert(tableReservation, reservationModel.toMap());
    print('insert tabel reservation: $result');
  }

  Future<UserModel> findUserNameAndPassword(
      {@required String userName, @required String password}) async {
    var db = await this.database;
    var result = await db.rawQuery(
        "SELECT * FROM $tableNameUser WHERE userName = '$userName' and password = '$password'");
    if (result.length > 0) {
      print(jsonEncode(result.first.toString()));
      return UserModel.fromMap(result.first);
    }
    return null;
  }

  Future<String> findNickNameFromId({@required String id}) async {
    var db = await this.database;
    var result =
        await db.rawQuery("SELECT * FROM $tableNameUser WHERE id = '$id'");
    if (result.length > 0) {
      print(jsonEncode(result.first.toString()));
      final data = UserModel.fromMap(result.first);
      return data.userName;
    }
  }

  Future<List<ReservationModel>> getAllDataReservation() async {
    var db = await this.database;
    final List<Map<String, dynamic>> result = await db.rawQuery("SELECT * FROM $tableReservation");
    return List.generate(result.length, (index) {
      return ReservationModel(
          reservationDate: result[index]['reservationDate'],
          reservationId: result[index]['reservationId'],
          restauranId: result[index]['restauranId'],
          seatNumber: result[index]['seatNumber'],
          userId: result[index]['userId']);
    });
  }
}
