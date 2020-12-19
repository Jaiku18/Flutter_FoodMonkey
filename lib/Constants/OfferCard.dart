import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';

class OfferCard extends StatelessWidget {
  String firstDes;
  String secondDes;
  String imagePath;
  Color color;
  OfferCard(this.firstDes, this.secondDes, this.imagePath, this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        image: DecorationImage(
            image: AssetImage("UI/Backgroung_UI.PNG"), fit: BoxFit.fill),
      ),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Container(
          height: 150,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color.withOpacity(0.6),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      firstDes,
                      style: fontStyle.copyWith(fontSize: 25),
                    ),
                    Text(
                      secondDes,
                      style: fontStyle.copyWith(fontSize: 25),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Image(
                  image: AssetImage(imagePath),
                ),
              ),
              SizedBox(width: 15)
            ],
          ),
        ),
      ),
    );
  }
}
