import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemButton extends StatelessWidget {
  Color buttoncolor;
  // ignore: non_constant_identifier_names
  IconData Icond;
  // ignore: non_constant_identifier_names
  ItemButton({super.key, required this.buttoncolor, required this.Icond});

  @override
  Widget build(BuildContext) {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icond),
      color: buttoncolor,
    );
  }
}
