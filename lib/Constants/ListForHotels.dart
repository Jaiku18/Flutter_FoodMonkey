import 'package:flutter/material.dart';
import 'package:food_delivery_app/Constants/Colors.dart';
import 'package:food_delivery_app/Constants/MenuCards.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ListForHotels extends StatelessWidget {
  String itemName;
  String description;
  String amount;
  String imgPath;
  String index;
  bool OnlyVeg;
  Color colors;
  String rating;
  ListForHotels(this.itemName, this.description, this.amount, this.imgPath,
      this.index, this.OnlyVeg, this.rating);

  @override
  Widget build(BuildContext context) {
    if (OnlyVeg) {
      colors = Colors.green;
    } else {
      colors = Colors.red;
    }
    return GestureDetector(
      child: Flexible(
        child: Container(
          height: 150,
          width: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,
          ),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 80,
                      width: 80,
                      child: Image(
                        image: AssetImage(imgPath),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                itemName,
                                style: fontStyle.copyWith(fontSize: 20),
                              ),
                            ),
                            Icon(
                              Octicons.primitive_dot,
                              color: colors,
                            )
                          ],
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          rating + ' / 5',
                          style: fontStyle.copyWith(fontSize: 15),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          description,
                          style: fontStyle.copyWith(fontSize: 15),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 10,
                          ),
                        ),
                        Text(
                          '\$' + amount.toString() + ' for two ',
                          style: fontStyle.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MenuCards(int.parse(index), itemName)),
        );
        print(index.toString());
      },
    );
  }
}
