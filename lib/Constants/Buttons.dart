import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';

class Buttons extends StatelessWidget {
  String Description;
  Color buttonColor;
  Function onPressedEvent;
  double height;
  double width;
  int amount;
  Buttons(
      {this.Description,
      this.buttonColor,
      this.onPressedEvent,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedEvent,
      child: Expanded(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              Description,
              style: fontStyle.copyWith(fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
