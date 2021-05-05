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
    return database;
  }

  void insertTableUser(UserModel userModel) async {
    var db = await this.database;
    var result = await db.insert(tableNameUser, userModel.toMap());
    print('result: $result');
  } 
}
