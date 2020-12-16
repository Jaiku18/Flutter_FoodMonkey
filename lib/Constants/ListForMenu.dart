import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:food_delivery_app/Model/MenuModel.dart';

class ListForMenu extends StatefulWidget {
  String itemName;
  String description;
  String amount;
  String imgPath;
  String HotelName;

  ListForMenu(this.itemName, this.description, this.amount, this.imgPath,
      this.HotelName);
  @override
  _ListForMenuState createState() => _ListForMenuState();
}

class _ListForMenuState extends State<ListForMenu> {
  int numberOfItem = 0;
  AfterAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem -= 1;
              /*  MyCartItems.remove(ListForMenu(widget.itemName,
                  widget.description, widget.amount, widget.imgPath));*/
              if (numberOfItem < 1) {
                MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
              }

              if (numberOfItem < 0) {
                numberOfItem = 0;
                MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
              }
              numberToReturn = numberOfItem;
              MyCartItem.single.numberofItems =
                  (MyCartItem.single.numberofItems - 1);
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Color(0xFF7A9BEE)),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
        Text(numberOfItem.toString(),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 15.0)),
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem += 1;
              if (MyCartItem.where(
                      (element) => element.itemName == widget.itemName) !=
                  null) {
                print('woooooooo');
                MyCartItem.single.numberofItems =
                    (MyCartItem.single.numberofItems + 1);
              } else {
                MyCartItem.add(MenuItem(
                    widget.itemName,
                    widget.description,
                    widget.amount,
                    widget.imgPath,
                    numberOfItem,
                    widget.HotelName));

                /*MyCartItems.add(ListForMenu(widget.itemName, widget.description,
                    widget.amount, widget.imgPath));*/
              }

              /*if (MyCartItems.contains(
                widget.itemName,
              )) {
                print('wowwwwww');
              } else {
                MyCartItem.add(MenuItem(widget.itemName, widget.description,
                    widget.amount, widget.imgPath, numberOfItem));
              }*/

              print(numberOfItem);
              numberToReturn = numberOfItem;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Center(
              child: Icon(
                Icons.add,
                color: Color(0xFF7A9BEE),
                size: 20.0,
              ),
            ),
          ),
        )
      ],
    );
  }

  Add() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Add',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 15.0)),
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem += 1;
              MyCartItem.add(MenuItem(
                  widget.itemName,
                  widget.description,
                  widget.amount,
                  widget.imgPath,
                  numberOfItem,
                  widget.HotelName));
              /*MyCartItems.add(ListForMenu(widget.itemName, widget.description,
                  widget.amount, widget.imgPath));*/
              if (numberOfItem < 0) {
                numberOfItem = 0;
                MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
                /* MyCartItems.remove(ListForMenu(widget.itemName,
                    widget.description, widget.amount, widget.imgPath));*/
              }
              numberToReturn = numberOfItem;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Color(0xFF7A9BEE)),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Flexible(
        child: Container(
          height: 170,
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
                        image: AssetImage(widget.imgPath),
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
                          widget.itemName,
                          style: fontStyle.copyWith(fontSize: 20),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          widget.description,
                          style: fontStyle.copyWith(fontSize: 15),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Rs  ' + widget.amount,
                                style: fontStyle.copyWith(fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              width: 125.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: Color(0xFF7A9BEE)),
                              child: Flexible(
                                  child:
                                      numberOfItem == 0 ? Add() : AfterAdd()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        print(numberOfItem);
      },
    );
  }
}
