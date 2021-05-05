import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

final String tableNameUser = "use_profile";
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
            id integer primary key autoincrement, 
            userName text not null,
            nickname text not null,
            dateOfBird text not null,
            gender text not null,
            address text not null,
            nationality text not null,
            password text not null)
        ''');
      },
    );

    // insertTableUser(DummyData.injectUser);

    return database;
  }

  void insertTableUser(UserModel userModel) async {
    var db = await this.database;
    var result = await db.insert(tableNameUser, userModel.toMap());
    print('result: $result');
  }

  Future<UserModel> findUserNameAndPassword(
      {@required String userName, @required String password}) async {
    var db = await this.database;
    var result = await db.rawQuery(
        "SELECT * FROM $tableNameUser WHERE userName = '$userName' and password = '$password'");
    if (result.length > 0) {
      return UserModel.fromMap(result.first);
    }
    return null;
  }
}
