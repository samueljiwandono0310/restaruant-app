import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/dummy/dummy_data.dart';
import 'package:restaurant_app/screens/reservation_form/reservation_form.dart';

class DetailMainScreen extends StatefulWidget {
  final int index;
  DetailMainScreen({Key key, @required this.index}) : super(key: key);
  @override
  _DetailMainScreenState createState() => _DetailMainScreenState();
}

class _DetailMainScreenState extends State<DetailMainScreen> {
  int _index = 0;

  @override
  void initState() {
    _index = widget.index;
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
          "Detail Restaurant",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                child: Image.asset(
                  DummyData.restaurantList[_index].restaurantImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        DummyData.restaurantList[_index].restaurantName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          DummyData.restaurantList[_index].restaurantRating
                              .toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.yellow,
                        )
                      ],
                    ), 
                    Container(
                      child: Text(
                        DummyData.restaurantList[_index].restaurantDescription,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => ReservationForm(
                      restauranId: DummyData.restaurantList[_index].id,
                    ),
                  ),
                );
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
            child: Text(
              "Reservation",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
