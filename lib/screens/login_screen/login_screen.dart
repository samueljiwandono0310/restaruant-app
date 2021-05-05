import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/bloc/login_bloc.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/helper/pref_helper.dart';
import 'package:restaurant_app/helper/pref_key.dart';
import 'package:restaurant_app/widgets/static_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String _errorMessage = "";
  bool _isValid = false;
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
              StaticWidget.formText(
                  hintText: "Username", controller: _userNameController),
              StaticWidget.sizeBox(),
              StaticWidget.formPassword(
                  hintText: "Password", controller: _passwordController),
              _errorMessage.isNotEmpty ? StaticWidget.sizeBox() : SizedBox(),
              _errorMessage.isNotEmpty
                  ? Container(
                      child: Text(
                        _errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox(),
              StaticWidget.sizeBox(),
              _buttonLogin(),
              StaticWidget.sizeBox(),
              !_isValid ? _buttonRegister() : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      child: InkWell(
        onTap: () {
          doLogin();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: double.infinity,
          height: 50.0,
          child: Center(
            child: !_isValid
                ? Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                : CircularProgressIndicator(
                    backgroundColor: Colors.black,
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

  void doLogin() {
    if (_userNameController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = "* Email and password is required!";
      });
    } else {
      setState(() {
        _errorMessage = "";
        _isValid = true;
      });
      loginBloc.doInsertDataBase(_userNameController.text, _passwordController.text);
    }
  }
}
