import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/bloc/registration_bloc.dart';
import 'package:restaurant_app/constant/constant..dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/model/user_model.dart';
import 'package:restaurant_app/widgets/static_widget.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _nickNameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _userPasswordController = new TextEditingController();
  TextEditingController _userPasswordConfirmationController =
      new TextEditingController();
  var _dateTimeValue;
  var _gender;
  var _nationality;
  String _isValid = "";
  bool _validation = false;

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
            StaticWidget.formText(
                hintText: "Please input user name",
                controller: _userNameController),
            StaticWidget.sizeBox(),
            StaticWidget.formText(
                hintText: "Please input nick name",
                controller: _nickNameController),
            StaticWidget.sizeBox(),
            StaticWidget.formText(
                hintText: "Please input address",
                controller: _addressController),
            StaticWidget.sizeBox(),
            StaticWidget.formPassword(
                hintText: "Please input password",
                controller: _userPasswordController),
            StaticWidget.sizeBox(),
            StaticWidget.formPassword(
                hintText: "Please input password confirmation",
                controller: _userPasswordConfirmationController),
            StaticWidget.sizeBox(),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext contex) {
                      return _buildBottomPicker(CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (DateTime value) {
                            setState(() {
                              _dateTimeValue =
                                  "${value.day}-${value.month}-${value.year}";
                            });
                          }));
                    });
              },
              child: StaticWidget.boxValue(
                  hintText: _dateTimeValue ?? "Date of birth",
                  focused: _dateTimeValue == null ? false : true),
            ),
            StaticWidget.sizeBox(),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext contex) {
                      return _buildPickerInterface(DummyData.gender, "gender");
                    });
              },
              child: StaticWidget.boxValue(
                  hintText: _gender ?? "Gender",
                  focused: _gender == null ? false : true),
            ),
            StaticWidget.sizeBox(),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext contex) {
                      return _buildPickerInterface(
                          DummyData.nationality, "nationality");
                    });
              },
              child: StaticWidget.boxValue(
                  hintText: _nationality ?? "nationality",
                  focused: _nationality == null ? false : true),
            ),
            StaticWidget.sizeBox(),
            _isValid.isEmpty
                ? SizedBox()
                : Container(
                    child: Text(
                      "* $_isValid",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            StaticWidget.sizeBox(),
            !_validation ? _buttonReset() : SizedBox(),
            !_validation ? StaticWidget.sizeBox() : SizedBox(),
            _buttonRegister(),
            StaticWidget.sizeBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerInterface(List<String> data, String type) {
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
      onSelectedItemChanged: (int value) {
        if (type == "gender") {
          setState(() {
            _gender = data[value];
          });
        } else {
          setState(() {
            _nationality = data[value];
          });
        }
      },
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

  Widget _buttonRegister() {
    return Container(
      child: InkWell(
        onTap: () => {doRegister()},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: double.infinity,
          height: 50.0,
          child: Center(
            child: !_validation
                ? Text(
                    "Register",
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

  Widget _buttonReset() {
    return Container(
      child: InkWell(
        onTap: () {
          setState(() {
            _userNameController.clear();
            _nickNameController.clear();
            _addressController.clear();
            _userPasswordController.clear();
            _userPasswordConfirmationController.clear();
            _dateTimeValue = null;
            _gender = null;
            _nationality = null;
          });
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

  void doRegister() {
    if (_userNameController.text.isEmpty ||
        _nickNameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _userPasswordController.text.isEmpty ||
        _userPasswordConfirmationController.text.isEmpty ||
        _dateTimeValue == null ||
        _gender == null ||
        _nationality == null) {
      setState(() {
        _isValid = "all text is required";
      });
    } else if (!Constant.reqexExp.hasMatch(_userPasswordController.text)) {
      setState(() {
        _isValid =
            "password must containt special character, uppercase, lowercase";
      });
    } else if (_userPasswordController.text !=
        _userPasswordConfirmationController.text) {
      setState(() {
        _isValid = "password and password confirmation not same";
      });
    } else if (_userPasswordController.text.length < 8 ||
        _userPasswordController.text.length > 32) {
      setState(() {
        _isValid = "password must be min 8 characters and max 32 characters";
      });
    } else {
      setState(() {
        _isValid = "";
        _validation = true;
      });
      registrationBloc.registrationAction(
        _userNameController.text,
        _nickNameController.text,
        _dateTimeValue,
        _gender,
        _addressController.text,
        _nationality,
        _userPasswordController.text,
      );
    }
  }
}
