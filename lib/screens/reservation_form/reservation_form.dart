import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/bloc/reservation_bloc.dart';
import 'package:restaurant_app/widgets/static_widget.dart';

class ReservationForm extends StatefulWidget {
  final restauranId;
  ReservationForm({Key key, this.restauranId});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  String _dateTime;
  int _seatNumber;
  bool _isProcessing = false;
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
          "Reservation Form",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext contex) {
                      return _buildPickerInterface();
                    });
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 12.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    _seatNumber == null
                        ? "Choose Seat reservation"
                        : "seat number: ${_seatNumber.toString()}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
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
                              _dateTime =
                                  "${value.day}-${value.month}-${value.year}";
                            });
                          }));
                    });
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 12.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                ),
                child: Center(
                  child: Text(
                    _dateTime == null ? "Choose your date" : _dateTime,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            _isProcessing = true;
          });
          reservationBloc.doSaveReservation(
              _seatNumber, _dateTime, widget.restauranId);
        },
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
          child: Center(
            child: !_isProcessing
                ? Text(
                    "Reserve Now!",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _buildPickerInterface() {
    final FixedExtentScrollController scrollController =
        FixedExtentScrollController(initialItem: 0);
    return _buildBottomPicker(CupertinoPicker(
      scrollController: scrollController,
      itemExtent: 32.0,
      backgroundColor: Colors.white,
      children: List<Widget>.generate(32, (int index) {
        return Center(
          child: Text((index + 1).toString()),
        );
      }),
      onSelectedItemChanged: (int value) {
        setState(() {
          _seatNumber = value + 1;
        });
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
}
