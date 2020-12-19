import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/GetHotels.dart';

import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:food_delivery_app/Constants/getLocation.dart';

class hotelMenu extends StatefulWidget {
  static const String id = 'HotelMenu';
  @override
  _hotelMenuState createState() => _hotelMenuState();
}

class _hotelMenuState extends State<hotelMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            child: Flexible(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(AntDesign.down),
                        iconSize: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pick Up From',
                            style: fontStyle.copyWith(
                                fontSize: 25, color: Colors.black),
                          ),
                          Text(
                            'Name of the hotel',
                            style: fontStyle.copyWith(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: SizedBox(width: 160),
                      ),
                      IconButton(
                        icon: Icon(AntDesign.filter),
                        iconSize: 25,
                        onPressed: () {
                          getHotels();
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Flexible(
                    child: Container(
                      child: ListView(
                          scrollDirection: Axis.vertical, children: []),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
