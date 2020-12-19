import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/NotificationScreen.dart';
import 'package:food_delivery_app/Constants/Buttons.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Screens/payment_screen.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:get/get.dart';

class MyCart extends StatefulWidget {
  static const String id = 'MyCart';
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    // TODO: implement initState
    getSum();

    super.initState();
  }

  double sum = 0;
  getSum() {
    productController.MyCartItem.forEach((element) {
      sum = int.parse(element.amount) * element.numberofItems + sum;
    });
    print(sum);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              child: Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Top of the day',
                          style: fontStyle.copyWith(
                              fontSize: 35, color: Colors.black),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 30,
                          width: 30,
                          child: Image(
                            image: AssetImage("UI/002-burger.png"),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    listCardForTodayMenu(
                        'Discover',
                        'BEST DEAL OF THE DAY',
                        Image(
                          image: AssetImage("UI/050-pizza.png"),
                        ),
                        color_for_Gradiant,
                        color_for_Gradiant2,
                        150,
                        500),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Your Collection..',
                          style: fontStyle.copyWith(fontSize: 30),
                        ),
                        IconButton(
                          onPressed: () => productController.getClearList(),
                          icon: Icon(
                            AntDesign.dropbox,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        width: 500,
                        child: GetBuilder<ProductController>(
                          builder: (productController) {
                            return ListView(
                              children: productController.MyCartItem,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Total ',
                            style: fontStyle.copyWith(fontSize: 35),
                          ),
                          Text(
                            sum.toString(),
                            style: fontStyle.copyWith(fontSize: 35),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Buttons(
                        onPressedEvent: () => checkOutFun(sum),
                        buttonColor: Color(0xFF6200EE).withOpacity(0.6),
                        height: 30,
                        width: 500,
                        Description: 'Check Out',
                        /*CheckOut, Colors.yellowAccent,
                          openCheckout(150), 30, 500*/
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkOutFun(double amount) {
    notificationPlugin.showNotification();
    openCheckout(amount);
    print(productController.MyCartItem.single.hotelName.toString());
  }
}
