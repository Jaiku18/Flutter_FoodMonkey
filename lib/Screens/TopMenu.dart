import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:food_delivery_app/Constants/Buttons.dart';
import 'package:food_delivery_app/Screens/payment_screen.dart';
import 'package:get/get.dart';

class TopMenu extends StatefulWidget {
  static const String id = 'TopMenu';
  @override
  _TopMenuState createState() => _TopMenuState();
}

class _TopMenuState extends State<TopMenu> {
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  double sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.list, size: 30),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white24.withOpacity(1),
                    child: Image(
                      image: AssetImage("UI/050-pizza.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Text('Top of the day',
                      style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.w500,
                          fontSize: 35)
                      /*fontStyle.copyWith(fontSize: 35, color: Colors.black),*/
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'MostPopular',
                    style:
                        fontStyle.copyWith(fontSize: 25, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(AntDesign.arrowright),
                  )
                ],
              ),
              SizedBox(height: 10),
              Flexible(child: StatefulBuilder(builder: (context, setState) {
                return ListView(
                  children: productController.MyCartItem,
                );
              })),
              /*(
                  child: GridView.count(
                      scrollDirection: Axis.vertical,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      children: _listItem),
                ),*/

              SizedBox(height: 10),
              Flexible(
                child: Buttons(
                  onPressedEvent: () => openCheckout(sum),
                  buttonColor: Colors.yellowAccent,
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
    );
  }
}

/*
final List<Widget> _listItem = [
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Button,
      1),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Button,
      2),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Button,
      3),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Button,
      4),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Gradiant,
      color_for_Gradiant,
      5),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Button,
      6),
  listCardForMostPopularMenu(
      'Drink',
      Image(
        image: AssetImage("UI/046-Soft drink.png"),
      ),
      color_for_Button,
      color_for_Gradiant,
      7),
];
*/
