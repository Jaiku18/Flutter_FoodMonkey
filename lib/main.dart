import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/MyCart.dart';
import 'Screens/HotelScreen.dart';
import 'Screens/WelcomeScreen.dart';
import 'Screens/TopMenu.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/FoodMonkeyScreen.dart';
import 'Screens/ToAddInFireStore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Color(0xFF6200EE).withOpacity(0.8),
      ),
      initialRoute: welcomeScreen.id,
      routes: {
        ToBeAdded.id: (context) => ToBeAdded(),
        homePage.id: (context) => homePage(),
        FoodMonkey.id: (context) => FoodMonkey(),
        welcomeScreen.id: (context) => welcomeScreen(),
        MyCart.id: (context) => MyCart(),
        TopMenu.id: (context) => TopMenu(),
        hotelMenu.id: (context) => hotelMenu(),
      },
    );
  }
}
