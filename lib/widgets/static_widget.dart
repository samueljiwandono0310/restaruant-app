import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticWidget {
  static Widget formText({@required String hintText, @required TextEditingController controller}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  static Widget boxValue({@required String hintText}) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 12.5, 20.0, 12.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32.0),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Text(
        hintText,
        style: TextStyle(
          color: Colors.black.withOpacity(0.65),
          fontSize: 16.0
        ),
      ),
    );
  }

  static Widget formPassword({@required String hintText, @required TextEditingController controller}) {
    return TextFormField(
      autofocus: false,
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  static Widget sizeBox() {
    return SizedBox(
      height: 20.0,
    );
  }
}
