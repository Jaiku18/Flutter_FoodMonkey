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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: Color(0xFF6200EE),
        unselectedItemColor: Color(0xFF6200EE).withOpacity(0.4),
        onTap: onTap,
        currentIndex: _currentIndex,
        items: [
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
        ],
      ),
    );
  }
}
