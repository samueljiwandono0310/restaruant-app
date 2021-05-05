import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReservationHistoryScreen extends StatefulWidget {
  @override
  _ReservationHistoryScreenState createState() => _ReservationHistoryScreenState();
}

class _ReservationHistoryScreenState extends State<ReservationHistoryScreen> {
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
    );
  }
}