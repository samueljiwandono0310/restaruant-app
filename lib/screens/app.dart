import 'package:flutter/material.dart';
import 'package:restaurant_app/config/routes.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/screens/splash_screen/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  DatabaseHelper _database = DatabaseHelper();
  @override
  void initState() {
    _database
        .initializeDatabase()
        .then((value) => {print("------initialize database success")});
    _database.insertTableUser(DummyData.injectUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: NavigationRoutes.generateRoute,
    );
  }
}
