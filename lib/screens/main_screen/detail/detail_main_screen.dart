import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    );
  }
}
