import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/MenuCards.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:get/get.dart';

class ListForHotels extends StatelessWidget {
  String itemName;
  String description;
  String amount;
  String imgPath;
  String index;
  bool OnlyVeg;
  Color colors;
  String rating;
  ListForHotels(this.itemName, this.description, this.amount, this.imgPath,
      this.index, this.OnlyVeg, this.rating);
  ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    if (OnlyVeg) {
      colors = Colors.green;
    } else {
      colors = Colors.red;
    }
    return GestureDetector(
      child: Flexible(
        child: Container(
          height: 190,
          width: 600,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          /*decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,
          ),*/
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                itemName,
                                style: fontStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Icon(
                              Octicons.primitive_dot,
                              color: colors,
                            )
                          ],
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          rating + ' / 5',
                          style: fontStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          description,
                          style: fontStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          'Rs' + amount.toString() + ' for two ',
                          style: fontStyle.copyWith(fontSize: 15),
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
        if (productController.MyCartItem.length != 0) {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Alert Foodies!!!!'),
                  content: Column(
                    children: [
                      Text('There is already some food in the cart'),
                      Text('Do you want to remove them????'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        productController.MyCartItem.clear();
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MenuCards(int.parse(index), itemName),
                          ),
                        );
                      },
                    ),
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuCards(int.parse(index), itemName),
          ),
        );
        print(index.toString());
      },
    );
  }
}
