import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/DatabaseManagement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/Constants/ListForMenu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MenuCards extends StatefulWidget {
  int SelectedHotel;
  String HotelName;
  MenuCards(this.SelectedHotel, this.HotelName);
  @override
  _MenuCardsState createState() => _MenuCardsState();
}

List resultList = [];

class _MenuCardsState extends State<MenuCards> {
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
              Text('Order from ' + widget.HotelName)
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: resultList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListForMenu(
                      resultList[index]['Name'],
                      resultList[index]['Desc'],
                      resultList[index]['Amount'],
                      resultList[index]['image'],
                      widget.HotelName,
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
          )
        ]),
      )),
    );
  }
}
