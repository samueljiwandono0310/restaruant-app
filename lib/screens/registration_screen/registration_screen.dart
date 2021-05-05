import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/widgets/static_widget.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _nickNameController = new TextEditingController();
  TextEditingController _addressController  = new TextEditingController();
  TextEditingController _userPasswordController = new TextEditingController();
  TextEditingController _userPasswordConfirmationController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
              ),
              child: Text(
                "User Register",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
            StaticWidget.sizeBox(),
            StaticWidget.formText(hintText: "Please input user name", controller: _userNameController),
            StaticWidget.sizeBox(),
            StaticWidget.formText(hintText: "Please input nick name", controller: _nickNameController),
            StaticWidget.sizeBox(),
            StaticWidget.formText(hintText: "Please input address", controller: _addressController),
            StaticWidget.sizeBox(),
            StaticWidget.formPassword(hintText: "Please input password", controller: _userPasswordController),
            StaticWidget.sizeBox(),
            StaticWidget.formPassword(hintText: "Please input password confirmation", controller: _userPasswordConfirmationController),
            StaticWidget.sizeBox(),
            StaticWidget.boxValue(hintText: "Date of birth"),
            StaticWidget.sizeBox(),
            StaticWidget.boxValue(hintText: "Gender"),
            StaticWidget.sizeBox(),
            StaticWidget.boxValue(hintText: "Nationality"),
            StaticWidget.sizeBox(),
            _buttonRegister(),
            StaticWidget.sizeBox(),
            _buttonReset(),
            StaticWidget.sizeBox()
          ],
        ),
      ),
    );
  }

  Widget _buildPickerInterface(List<String> data, String typePicker) {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: 0);
    return _buildBottomPicker(CupertinoPicker(
      scrollController: scrollController,
      itemExtent: 32.0,
      backgroundColor: Colors.white,
      children: List<Widget>.generate(data.length, (int index) {
        return Center(
          child: Text(data[index]),
        );
      }),
      onSelectedItemChanged: (int value) {},
    ));
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 130.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  static Widget _buttonRegister() {
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

    static Widget _buttonReset() {
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
              "Reset",
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
