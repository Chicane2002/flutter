import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemContainer extends StatelessWidget {
  Color contcolor;
  double w;
  double h;
  String textData;
  ItemContainer(
      {super.key,
      required this.contcolor,
      required this.textData,
      this.w = 100,
      this.h = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height, //gives full screen
      // width: MediaQuery.of(context).size.width,
      height: h,
      width: w,
      color: contcolor,
      child: Text(
        textData,
        // ignore: prefer_const_constructors
        style: TextStyle(color: Color.fromARGB(255, 229, 255, 0)),
      ),
    );
  }
}
