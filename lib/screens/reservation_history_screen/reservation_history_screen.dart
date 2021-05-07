import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/bloc/reservation_bloc.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/helper/databaseHelper.dart';
import 'package:restaurant_app/helper/pref_helper.dart';
import 'package:restaurant_app/helper/pref_key.dart';
import 'package:restaurant_app/model/user_reservation.dart';

class ReservationHistoryScreen extends StatefulWidget {
  @override
  _ReservationHistoryScreenState createState() =>
      _ReservationHistoryScreenState();
}

class _ReservationHistoryScreenState extends State<ReservationHistoryScreen> {
  String userName;
  DatabaseHelper _database = DatabaseHelper();
  List<ReservationModel> _reservationData = new List<ReservationModel>();

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Reservation History",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _reservationData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 6.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                        right: new BorderSide(
                          width: 1.0,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                    child: Image.asset(DummyData
                            .restaurantList[
                                reservationBloc.searchReservationImage(
                                    _reservationData[index])]
                            .restaurantImage ??
                        ""),
                  ),
                  title: Text(
                    DummyData
                            .restaurantList[
                                reservationBloc.searchReservationImage(
                                    _reservationData[index])]
                            .restaurantName ??
                        "",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.linear_scale, color: Colors.yellowAccent),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "${DummyData.restaurantList[reservationBloc.searchReservationImage(_reservationData[index])].restaurantRating ?? ""}",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(Icons.star_outline, color: Colors.yellowAccent)
                        ],
                      ),
                      Text(
                        "Reservation name: ${userName ?? ''}",
                        style: TextStyle(color: Colors.black, fontSize: 8.0),
                      ),
                      Text(
                        "Seat number: ${_reservationData[index].seatNumber}",
                        style: TextStyle(color: Colors.black, fontSize: 8.0),
                      ),
                      Text(
                        "Reservation Id: ${_reservationData[index].reservationId}",
                        style: TextStyle(color: Colors.black, fontSize: 8.0),
                      ),
                      Text(
                        "Reservation date: ${_reservationData[index].reservationDate}",
                        style: TextStyle(color: Colors.black, fontSize: 8.0),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void getData() async {
    final result = await _database.getAllDataReservation();
    final _userId = await PrefHelper().getString(describeEnum(PrefsKey.id));
    final _userName = await _database.findNickNameFromId(id: _userId);
    setState(() {
      _reservationData = result;
      userName = _userName;
      print(_reservationData.length);
    });
  }
}
