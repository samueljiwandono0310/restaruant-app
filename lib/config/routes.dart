import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/login_screen/login_screen.dart';
import 'package:restaurant_app/screens/registration_screen/registration_screen.dart';
import 'package:restaurant_app/screens/splash_screen/splash_screen.dart';

class NavigationRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash-screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'login-screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'registration-screen':
        return MaterialPageRoute(builder: (_) => RegistrationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        );
    }
  }
}
