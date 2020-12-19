import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Screens/MyCart.dart';
import 'package:food_delivery_app/Screens/HotelScreen.dart';
import 'package:food_delivery_app/Screens/WelcomeScreen.dart';
import 'package:food_delivery_app/Screens/TopMenu.dart';
import 'package:food_delivery_app/Screens/FoodMonkeyScreen.dart';
import 'package:food_delivery_app/Screens/ChatBot.dart';

class homePage extends StatefulWidget {
  static const String id = 'homePage';
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [FoodMonkey(), MyCart(), HomePageDialogflow()];
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Color(0xFF6200EE).withOpacity(0.4),
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,

        /*   color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFF6200EE).withOpacity(0.4),*/

        /* backgroundColor: Color(0xFF6200EE).withOpacity(0.4),
           selectedItemColor: Color(0xFF6200EE),
        unselectedItemColor: Color(0xFF6200EE).withOpacity(0.4),*/
        onTap: onTap,
        items: [
          Icon(
            Icons.restaurant_menu,
            size: 20,
            color: Color(0xFF6200EE).withOpacity(0.7),
          ),
          Icon(
            Icons.shopping_cart,
            size: 20,
            color: Color(0xFF6200EE).withOpacity(0.7),
          ),
          Icon(
            Icons.chat_sharp,
            size: 20,
            color: Color(0xFF6200EE).withOpacity(0.7),
          )
        ],
        animationCurve: Curves.elasticInOut,
        animationDuration: Duration(milliseconds: 600),

        /*ex: _currentIndex,
_children [
          BottomNavigationBarItem(
              icon: Icon(AntDesign.piechart),
              // ignore: deprecated_member_use
              title: Text('FoodMonkey')),
          BottomNavigationBarItem(
              icon: Icon(AntDesign.shoppingcart),
              // ignore: deprecated_member_use
              title: Text('MyCart')),
          BottomNavigationBarItem(
              icon: Icon(AntDesign.user),
              // ignore: deprecated_member_use
              title: Text('Account')),
        ],*/
      ),
    );
  }
}
