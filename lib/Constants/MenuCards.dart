import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/DatabaseManagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/Constants/ListForMenu.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Screens/MyCart.dart';
import 'package:get/get.dart';

double sum = 0;
int len = 0;

class MenuCards extends StatefulWidget {
  int SelectedHotel;

  String HotelName;
  MenuCards(this.SelectedHotel, this.HotelName);
  @override
  MenuCardsState createState() => MenuCardsState();
}

List resultList = [];

class MenuCardsState extends State<MenuCards> {
  getMenu(int SelectedHotel) async {
    dynamic result;
    result = await DataBase().getMenuCard(SelectedHotel);

    print('working' + SelectedHotel.toString());
    if (result == null) {
      print('No items can be retrieved');
    } else {
      setState(() {
        resultList = result;
      });
    }
  }

  @override
  void initState() {
    getMenu(widget.SelectedHotel);
  }

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    productController.MyCartItem.forEach((element) {
      sum = int.parse(element.amount) * element.numberofItems + sum;
    });

    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 5, right: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(AntDesign.back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Order from ' + widget.HotelName,
                style: fontStyle.copyWith(fontSize: 20),
              ),
              SizedBox(
                width: 65,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListForMenu(
                      resultList[index]['Name'],
                      resultList[index]['Desc'],
                      resultList[index]['Amount'],
                      resultList[index]['image'],
                      widget.HotelName,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 10,
                      thickness: 1.5,
                      indent: 20,
                      endIndent: 20,
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: size.width,
            height: size.height * 0.08,
            color: Color(0xFF6200EE).withOpacity(0.6),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GetBuilder<ProductController>(
                  builder: (productController) {
                    return Text(
                      productController.getNumberofItem.toString() + ' items',
                      style: fontStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    );
                  },
                ),
                /*GetX<ProductController>(builder: (productController) {
                  return Text(productController.getNumberofItem.toString());
                } ),*/
                /* Expanded(
                  child: Obx(() {
                    return Text(
                      productController.getNumberofItem.toString() + ' items',
                      style: fontStyle.copyWith(fontSize: 15),
                    );
                  }),
                ),*/
                SizedBox(
                  width: 15,
                ),
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 15,
                ),
                GetBuilder<ProductController>(
                  builder: (productController) {
                    return Text(
                      'Rs ' + productController.getSumofAmount.toString(),
                      style: fontStyle.copyWith(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    );
                  },
                ),
                SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart()),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'View Cart',
                        style: fontStyle.copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      )),
    );
  }
}
