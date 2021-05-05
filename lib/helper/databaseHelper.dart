import 'package:restaurant_app/model/user_model.dart';
import 'package:sqflite/sqflite.dart';

final String tableNameUser = "use_profile";
final String tableReservation = "reservation";
class DatabaseHelper {
  Database _database;
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
            ${UserModel().id} integer primary key autoincrement, 
            ${UserModel().username} TEXT not null,
            ${UserModel().nickName} TEXT not null,
            ${UserModel().dateOfBird} DATETIME not null,
            ${UserModel().gender} TEXT not null,
            ${UserModel().address} TEXT not null,
            ${UserModel().nationality} TEXT not null,
            ${UserModel().password} TEXT not null)
          )
        ''');

         db.execute('''
          create table $tableReservation (
            ${UserModel().id} integer primary key autoincrement, 
            ${UserModel().username} text not null,
            ${UserModel().nickName} text not null,
            ${UserModel().dateOfBird} text not null,
            ${UserModel().gender} text not null,
            ${UserModel().address} text not null,
            ${UserModel().nationality} text not null,
            ${UserModel().password} text not null)
          )
        ''');
      },


    );
    return database;
  }
}
