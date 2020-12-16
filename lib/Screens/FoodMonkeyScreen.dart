import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Constants/getLocation.dart';
import 'package:food_delivery_app/Constants/Slider.dart';
import 'package:food_delivery_app/Model/databaseHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_delivery_app/Constants/ListForHotels.dart';
import 'package:food_delivery_app/Model/HotelItems.dart';
import 'package:food_delivery_app/Constants/DatabaseManagement.dart';
import 'package:firebase_core/firebase_core.dart';

class FoodMonkey extends StatefulWidget {
  static const String id = "FoodMonkey";
  @override
  _FoodMonkeyState createState() => _FoodMonkeyState();
}

int position = 0;
var value;
var AddressString = null;
var StringAdd = null;
List resultList = [];
bool isSwitched = false;

class _FoodMonkeyState extends State<FoodMonkey> {
  @override
  void initState() {
    _getUserCurrentLocation();
    getStringValue();
    getHotelsList();
  }

  getHotelsList() async {
    dynamic result;
    result = await DataBase().getHotels();
    // : await DataBase().getVegHotels();

    if (result == null) {
      print('No items can be retrieved');
    } else {
      setState(() {
        resultList = result;
      });
    }
  }

  databaseHelper dbHelper = databaseHelper.instance;
  List<hotelItems> HotelItems = new List();
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                      tooltip: 'YourLocation',
                      icon: Icon(Octicons.location),
                      onPressed: () {
                        _getUserCurrentLocation();
                      },
                    ),
                    Text(value.toString())
                  ],
                ),
                IconButton(
                  icon: Icon(Octicons.star),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SliderForOffers(),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  flex: 1,
                  child: Text('Hotels',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 25.0)),
                ),
                SizedBox(
                  width: 85,
                ),
                Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Text('Veg Only',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 25.0)),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              getHotelsList();
                            });
                          },
                          activeColor: Colors.lightGreen,
                          activeTrackColor: Colors.green,
                        )
                      ],
                    )),
              ],
            ),
            Flexible(
              child: isSwitched ? getVeg() : getNonVeg(),
            ),
          ],
        ),
      ),
    );
  }

  getVeg() {
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        if (resultList[index]['OnlyVeg']) {
          return ListForHotels(
              resultList[index]['HotelName'],
              resultList[index]['Cusine'],
              resultList[index]['Amount'],
              resultList[index]['Image'],
              resultList[index]['id'],
              resultList[index]['OnlyVeg'],
              resultList[index]['Rating']);
        } else {
          return Text('');
        }
      },
    );
  }

  getNonVeg() {
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListForHotels(
                resultList[index]['HotelName'],
                resultList[index]['Cusine'],
                resultList[index]['Amount'],
                resultList[index]['Image'],
                resultList[index]['id'],
                resultList[index]['OnlyVeg'],
                resultList[index]['Rating']),
            Divider(
              height: 10,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
            ),
          ],
        );
      },
    );
  }
}

var divider = Divider(
  height: 10,
  thickness: 1.5,
  indent: 20,
  endIndent: 20,
);
getStringValue() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_Location';
  value = prefs.getString(key) ?? 0;
  print('read: $value');
}

_getUserCurrentLocation() async {
  AddressString = await getUserLocation();

  StringAdd = AddressString.locality +
      AddressString.adminArea +
      AddressString.subLocality +
      AddressString.subAdminArea.toString();
  //'\n' +
  // AddressString.addressLine +
  //AddressString.featureName +
  //AddressString.thoroughfare +
  //AddressString.subThoroughfare.toString();
  print(StringAdd);
  final prefs = await SharedPreferences.getInstance();
  final key = 'user_Location';
  final value = StringAdd;
  prefs.setString(key, value);
}
