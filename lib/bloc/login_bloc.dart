import 'package:flutter/foundation.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/helper/pref_helper.dart';
import 'package:restaurant_app/helper/pref_key.dart';

class LoginBloc {
  static final LoginBloc _singleton = new LoginBloc._internal();
  factory LoginBloc() => _singleton;
  LoginBloc._internal();

  void doInsertDataBase(String userName, String password) {
    DatabaseHelper()
        .findUserNameAndPassword(
          userName: userName,
          password: password,
        )
        .then((value) => {
              _setCredential(
                value.id,
                value.userName,
                value.nickName,
                value.dateOfBird,
                value.gender,
                value.address,
                value.nationality,
              ),
              print(
                  "result : ${value.id} , ${value.userName}, ${value.password} "),
            });
  }

  void _setCredential(
    int id,
    String username,
    String nickName,
    String dateOfBird,
    String gender,
    String address,
    String nationality,
  ) {
    PrefHelper().setInt(
      describeEnum(PrefsKey.id),
      id ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.userName),
      username ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.nickName),
      nickName ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.dateOfBird),
      dateOfBird ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.gender),
      gender ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.address),
      address ?? "",
    );
    PrefHelper().setString(
      describeEnum(PrefsKey.nationality),
      nationality ?? "",
    );
  }
}

final loginBloc = LoginBloc();
