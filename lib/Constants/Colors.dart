import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:math';
import 'package:food_delivery_app/Constants/ListForMenu.dart';

double screenWidth = 0.0;
double screenHeight = 0.0;
int numberToReturn = 0;

TextStyle fontStyle =
    TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.w500, fontSize: 35);
/*GoogleFonts.prociono(
    fontStyle: FontStyle.italic, fontSize: 10, color: Colors.black);*/

const color_for_Button = Color(0xFF473fb5);
const color_for_Gradiant = Color(0xFFADA3D4);
const color_for_Gradiant2 = Color(0xFFC2BAC9);
//height=15,width=screenwidth

//height=200,width=screenwidth

class PlusMinusButton extends StatefulWidget {
  @override
  PlusMinusButtonState createState() => PlusMinusButtonState();
}

class PlusMinusButtonState extends State<PlusMinusButton> {
  int numberOfItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.0,
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0), color: Color(0xFF7A9BEE)),
      child: Flexible(child: numberOfItem == 0 ? Add() : AfterAdd()),
    );
  }

  AfterAdd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem -= 1;
              if (numberOfItem < 0) {
                numberOfItem = 0;
              }
              numberToReturn = numberOfItem;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Color(0xFF7A9BEE)),
            child: Center(
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
        Text(numberOfItem.toString(),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 15.0)),
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem += 1;

              print(numberOfItem);
              numberToReturn = numberOfItem;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0), color: Colors.white),
            child: Center(
              child: Icon(
                Icons.add,
                color: Color(0xFF7A9BEE),
                size: 20.0,
              ),
            ),
          ),
        )
      ],
    );
  }

  Add() {
    return Row(
      children: [
        Text('Add',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 15.0)),
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            setState(() {
              numberOfItem += 1;
              if (numberOfItem < 0) {
                numberOfItem = 0;
              }
              numberToReturn = numberOfItem;
            });
          },
          child: Container(
            height: 25.0,
            width: 25.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Color(0xFF7A9BEE)),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  int get numbers {
    return numberToReturn;
  }
}

listForMyCart(String firstString, String secondString, int amount,
    String imgPath, double Height, double Width) {
  return Container(
    height: Height,
    width: Width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.grey,
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  firstString,
                  style: fontStyle.copyWith(fontSize: 15, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  secondString,
                  style: fontStyle.copyWith(fontSize: 25, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Text(amount.toString(),
                          style: fontStyle.copyWith(
                              fontSize: 25, color: Colors.black)),
                      SizedBox(width: 15),
                      PlusMinusButton(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Flexible(
            child: Container(
              height: 80,
              width: 80,
              child: Image(
                image: AssetImage(imgPath),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//height=200,width=screenwidth
listCardForTodayMenu(String firstString, String secondString, Image img,
    Color color1, Color color2, double height, double width) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [color1, color2],
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  firstString,
                  style: fontStyle.copyWith(fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  secondString,
                  style: fontStyle.copyWith(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Flexible(child: img),
        ],
      ),
    ),
  );
}

//height=200,width=150
listCardForMostPopularMenu(
    String firstString, Image img, Color color1, Color color2, int index) {
  return GestureDetector(
    onTap: () {
      toNextPage(index);
    },
    child: Container(
      height: 300,
      width: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [color1, color2],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(child: img),
            SizedBox(width: 15),
            Text(
              firstString,
              style:
                  GoogleFonts.lato(fontStyle: FontStyle.italic, fontSize: 25),
            ),
          ],
        ),
      ),
    ),
  );
}

void toNextPage(int index) {
  // route next page with the selected index
  print(index.toString());
}
