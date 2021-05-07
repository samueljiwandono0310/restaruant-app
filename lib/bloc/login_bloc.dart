import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/helper/pref_helper.dart';
import 'package:restaurant_app/helper/pref_key.dart';

class LoginBloc {
  static final LoginBloc _singleton = new LoginBloc._internal();
  factory LoginBloc() => _singleton;
  LoginBloc._internal();

  setCredential(
    String id,
  ) async {
    print(id);
    PrefHelper().setString(describeEnum(PrefsKey.id), id ?? "",);
    Future.delayed(Duration(seconds: 5)).then((_) {
      Get.offNamedUntil("main-screen", (route) => false);
    });
  }
}

final loginBloc = LoginBloc();
