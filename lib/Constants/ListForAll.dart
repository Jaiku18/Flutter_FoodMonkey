import 'package:flutter/material.dart';
import 'Colors.dart';
import 'ListForMenu.dart';
import 'ListForHotels.dart';
import 'package:food_delivery_app/Constants/OfferCard.dart';
import 'package:food_delivery_app/Model/MenuModel.dart';

final List<Widget> listMenuItem = [
/*
  ListForMenu('Burger', 'Tasty burger you will have in your life', 150,
      'UI/002-burger.png'),
  divider,
  ListForMenu('Hot Dog', 'Tasty burger you will have in your life', 25,
      'UI/003-hot dog.png'),
  divider,
  ListForMenu('Chicken Leg', 'Tasty burger you will have in your life', 250,
      'UI/006-chicken leg.png'),
  divider,
  ListForMenu('Mustard', 'Tasty burger you will have in your life', 100,
      'UI/008-mustard.png'),
  divider,
  ListForMenu('Burger', 'Tasty burger you will have in your life', 150,
      'UI/002-burger.png'),
  divider,
  ListForMenu('French Fries', 'Tasty burger you will have in your life', 25,
      'UI/004-french fries.png'),
  divider,
  ListForMenu('Noodles', 'Tasty burger you will have in your life', 250,
      'UI/007-noodles.png'),
  divider,
  ListForMenu('Shawarma', 'Tasty burger you will have in your life', 100,
      'UI/017-shawarma.png'),*/
];

var divider = Divider(
  height: 10,
  thickness: 1.5,
  indent: 20,
  endIndent: 20,
);

final List<Widget> MyCartItems = [];
final List<MenuItem> MyCartItem = [];

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

final List<Widget> listForHotels = [
  /* ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/saravana_bhavan.PNG', 1),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 2),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 3),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 4),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 5),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 6),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 7),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 8),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 9),
  ListForHotels(
      'Sample Hotel 1', 'Lets test first', "300", 'UI/006-chicken leg.png', 10)*/
];
