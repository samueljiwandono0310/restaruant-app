import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );

  final password = TextFormField(
    autofocus: false,
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
  );

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
              SizedBox(
                height: 20.0,
              ),
              email,
              SizedBox(
                height: 20.0,
              ),
              password,
              SizedBox(
                height: 20.0,
              ),
              Container(
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
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
