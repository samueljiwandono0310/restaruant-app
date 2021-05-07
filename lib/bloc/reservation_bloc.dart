import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/helper/pref_helper.dart';
import 'package:restaurant_app/helper/pref_key.dart';
import 'package:restaurant_app/model/user_reservation.dart';
import 'package:uuid/uuid.dart';

class ReservationBloc {
  static final ReservationBloc _singleton = new ReservationBloc._internal();
  factory ReservationBloc() => _singleton;
  ReservationBloc._internal();

  void doSaveReservation(
      int numberOfSeat, String dateTime, int restaurantId) async {
    final _userId = await PrefHelper().getString(describeEnum(PrefsKey.id));
    print(_userId);
    print(numberOfSeat);
    print(dateTime);
    print(restaurantId);

    var userReservation = ReservationModel(
        reservationId: Uuid().v4(),
        reservationDate: dateTime,
        restauranId: restaurantId,
        seatNumber: numberOfSeat,
        userId: _userId);

    DatabaseHelper().insertTableReservation(userReservation);
    Future.delayed(Duration(seconds: 5)).then((_) {
      Get.offNamedUntil('main-screen', (route) => false);
    });
  }

  searchReservationImage(ReservationModel reservationModel) {
    final index = DummyData.restaurantList.indexWhere((element) => element.id == reservationModel.restauranId);
    return index;
  }
}

final reservationBloc = ReservationBloc();
