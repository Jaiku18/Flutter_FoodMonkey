import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:food_delivery_app/Model/MenuModel.dart';
import 'package:food_delivery_app/Constants/MenuCards.dart';
import 'package:get/get.dart';

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
  ProductController productController = Get.put(ProductController());
  MenuCardsState menu = MenuCardsState();
  int numberOfItem = 0;
  int sumOfItems = 0;

  AfterAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            productController
                .getNumberofCartItem(productController.MyCartItem.length);
            productController.getSumAmount(sumOfItems);
            setState(() {
              sumOfItems = 0;
              productController.MyCartItem.forEach((element) {
                sumOfItems = int.parse(element.amount) * element.numberofItems +
                    sumOfItems;
              });

              numberOfItem -= 1;
              /*  MyCartItems.remove(ListForMenu(widget.itemName,
                  widget.description, widget.amount, widget.imgPath));*/
              if (numberOfItem < 1) {
                productController.MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
              }

              if (numberOfItem < 0) {
                numberOfItem = 0;
                productController.MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
              }
              numberToReturn = numberOfItem;
              productController.MyCartItem.single.numberofItems =
                  (productController.MyCartItem.single.numberofItems - 1);
              productController
                  .getNumberofCartItem(productController.MyCartItem.length);
              productController.getSumAmount(sumOfItems);
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
            productController
                .getNumberofCartItem(productController.MyCartItem.length);
            productController.getSumAmount(sumOfItems);
            setState(() {
              sumOfItems = 0;
              productController.MyCartItem.forEach((element) {
                sumOfItems = int.parse(element.amount) * element.numberofItems +
                    sumOfItems;
              });
              numberOfItem += 1;
              if (productController.MyCartItem.where(
                      (element) => element.itemName == widget.itemName) !=
                  null) {
                print('woooooooo');
                productController.MyCartItem.single.numberofItems =
                    (productController.MyCartItem.single.numberofItems + 1);
              } else {
                productController.MyCartItem.add(MenuItem(
                    widget.itemName,
                    widget.description,
                    widget.amount,
                    widget.imgPath,
                    numberOfItem,
                    widget.HotelName));
              }

              print(numberOfItem);
              numberToReturn = numberOfItem;

              productController
                  .getNumberofCartItem(productController.MyCartItem.length);
              productController.getSumAmount(sumOfItems);
            });

            /* productController.getNumberofCartItem(MyCartItem.length);
            productController.getSumAmount(sumOfItems);*/
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
            productController
                .getNumberofCartItem(productController.MyCartItem.length);
            productController.getSumAmount(sumOfItems);
            setState(() {
              sumOfItems = 0;
              productController.MyCartItem.forEach((element) {
                sumOfItems = int.parse(element.amount) * element.numberofItems +
                    sumOfItems;
              });

              numberOfItem += 1;
              productController.MyCartItem.add(MenuItem(
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
                productController.MyCartItem.removeWhere(
                    (element) => element.itemName == widget.itemName);
                /* MyCartItems.remove(ListForMenu(widget.itemName,
                    widget.description, widget.amount, widget.imgPath));*/
              }
              numberToReturn = numberOfItem;
              productController
                  .getNumberofCartItem(productController.MyCartItem.length);
              productController.getSumAmount(sumOfItems);
            });

            /*productController.getNumberofCartItem(MyCartItem.length);
            productController.getSumAmount(sumOfItems);*/
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
          height: 180,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 5.0),
              ]),
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
