import 'package:flutter/material.dart';
import 'package:restaurant_app/config/routes.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/screens/splash_screen/splash_screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: NavigationRoutes.generateRoute,
    );
  }
}