import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/ListForAll.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderForOffers extends StatefulWidget {
  @override
  _SliderForOffersState createState() => _SliderForOffersState();
}

int _currentIndex = 0;

class _SliderForOffersState extends State<SliderForOffers> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 1.0,
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      items: listForOfferCard.map((card) {
        return Builder(builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Card(
              color: Colors.blueAccent,
              child: card,
            ),
          );
        });
      }).toList(),
    );
  }
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}
