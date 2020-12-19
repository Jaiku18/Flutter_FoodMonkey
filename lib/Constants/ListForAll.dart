import 'package:flutter/material.dart';
import 'Colors.dart';
import 'ListForMenu.dart';
import 'ListForHotels.dart';
import 'package:food_delivery_app/Constants/OfferCard.dart';
import 'package:food_delivery_app/Model/MenuModel.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  int getNumberofItem = 0;
  int getSumofAmount = 0;
  final List<MenuItem> MyCartItem = [];
  getSumAmount(int amount) {
    getSumofAmount = 0;
    getSumofAmount = amount;
    update();
  }

  getNumberofCartItem(int number) {
    getNumberofItem = 0;
    getNumberofItem = number;
    update();
  }

  getClearList() {
    int length = MyCartItem.length;

    MyCartItem.removeRange(0, length);

    update();
  }
}

//final List<Widget> MyCartItems = [];

final List<Widget> listForOfferCard = [
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.pinkAccent),
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.orangeAccent),
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.yellowAccent),
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.blueAccent),
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.purpleAccent),
  OfferCard('Great Treat for the best oF days',
      'Use Monkey50 For discount upto 50%', 'UI/50%.png', Colors.brown)
];
