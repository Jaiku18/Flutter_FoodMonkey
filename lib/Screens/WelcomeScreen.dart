import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:local_auth/local_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery_app/Screens/HomeScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
bool check;

class welcomeScreen extends StatefulWidget {
  static const String id = "WelcomeScreen";
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("UI/Backgroung_UI.PNG"),
                fit: BoxFit.fitHeight),
          ),
          child: Scaffold(
            backgroundColor: Colors.white24.withOpacity(0.8),
            body: Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: GestureDetector(
                    onTap: () async {
                      check = await mainButtonEvent();
                      print(check);
                      // ignore: unrelated_type_equality_checks
                      if (check == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homePage()),
                        );
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage("UI/FoodmonkeyLogo.PNG"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Fastest Food Delivery',
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.italic, fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Get your Fav food the fastest way possible',
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Get started by clicking Monkey',
                          style: GoogleFonts.lato(
                            fontStyle: FontStyle.italic,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final LocalAuthentication _localAuthentication = LocalAuthentication();

Future<bool> mainButtonEvent() async {
  if (await isBiometricAvailable()) {
    await getListOfBiometricTypes();
    if (await authenticateUser()) {
      return true;
    }
  }
}

Future<bool> isBiometricAvailable() async {
  bool isAvailable = false;
  try {
    isAvailable = await _localAuthentication.canCheckBiometrics;
  } catch (e) {
    print(e.toString());
  }

  isAvailable
      ? print('Biometric is available!')
      : print('Biometric is unavailable.');

  return isAvailable;
}

Future<void> getListOfBiometricTypes() async {
  List<BiometricType> listOfBiometrics;
  try {
    listOfBiometrics = await _localAuthentication.getAvailableBiometrics();
  } catch (e) {
    print(e.toString());
  }

  print(listOfBiometrics);
}

Future<bool> authenticateUser() async {
  bool isAuthenticated = false;
  try {
    isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
      localizedReason: "Please authenticate to order food",
      useErrorDialogs: true,
      stickyAuth: true,
    );
  } catch (e) {
    print(e.toString());
  }

  isAuthenticated
      ? print('User is authenticated!')
      : print('User is not authenticated.');

  if (isAuthenticated) {
    return true;
  }
  return false;
}
