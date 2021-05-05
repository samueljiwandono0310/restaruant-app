import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/widgets/static_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                child: Container(
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              StaticWidget.sizeBox(),
              StaticWidget.formText(hintText: "Username", controller: _userNameController),
              StaticWidget.sizeBox(),
              StaticWidget.formPassword(hintText: "Password", controller: _passwordController),
              StaticWidget.sizeBox(),
              _buttonLogin(),
              _space(),
              _buttonRegister()
            ],
          ),
        ),
      ),
    );
  }

  static Widget _space() {
    return SizedBox(
      height: 20.0,
    );
  }

  static Widget _buttonLogin() {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: double.infinity,
          height: 50.0,
          child: Center(
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buttonRegister() {
    return Container(
      child: InkWell(
        onTap: () {
          Get.offNamedUntil("registration-screen", (route) => false);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: double.infinity,
          height: 50.0,
          child: Center(
            child: Text(
              "Register",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
