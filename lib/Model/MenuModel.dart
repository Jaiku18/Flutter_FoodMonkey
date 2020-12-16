import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';

class MenuItem extends StatelessWidget {
  String itemName;
  String description;
  String amount;
  String imgPath;
  int numberofItems;
  String hotelName;

  MenuItem(this.itemName, this.description, this.amount, this.imgPath,
      this.numberofItems, this.hotelName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white24,
      ),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Container(
                  height: 80,
                  width: 80,
                  child: Image(
                    image: AssetImage(imgPath),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      itemName,
                      style: fontStyle.copyWith(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: Text(
                        description,
                        style: fontStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              'Rs  ' + amount,
                              style: fontStyle.copyWith(fontSize: 15),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: 125.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.white12),
                            child: Flexible(
                              child: Text('X ' + numberofItems.toString()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
