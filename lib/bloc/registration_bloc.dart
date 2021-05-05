import 'package:get/get.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/model/user_model.dart';

class RegistrationBloc {
  static final RegistrationBloc _singleton = new RegistrationBloc._internal();
  factory RegistrationBloc() => _singleton;
  RegistrationBloc._internal();

  void registrationAction(
    String username,
    String nickName,
    String dateOfBird,
    String gender,
    String address,
    String nationality,
    String password,
  ) {
    var userModel = UserModel(
      userName: username,
      gender: gender,
      dateOfBird: dateOfBird,
      address: address,
      nationality: nationality,
      nickName: nickName,
      password: password,
    );
    DatabaseHelper().insertTableUser(userModel);

    Future.delayed(Duration(seconds: 5)).then((_) {
      Get.offNamedUntil("login-screen", (route) => false);
    });
  }
}

final registrationBloc = RegistrationBloc();
