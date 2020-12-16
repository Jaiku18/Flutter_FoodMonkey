import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class DataBase {
  getHotels() async {
    CollectionReference foodMonkey =
        FirebaseFirestore.instance.collection('Hotels');
    List itemList = [];
    try {
      await foodMonkey.getDocuments().then((querySnapShot) {
        querySnapShot.documents.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
    }
  }

  getMenuCard(int index) async {
    String menu = '/Hotels/' + index.toString() + '/Menu/';

    CollectionReference foodMonkey =
        FirebaseFirestore.instance.collection(menu);
    List itemList = [];
    try {
      await foodMonkey.getDocuments().then((querySnapShot) {
        querySnapShot.documents.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
    }
  }

  getVegHotels() async {
    /*List<DocumentSnapshot> documentList = (await Firestore.instance
        .collection('Hotels')
        .document()
        .collection('Hotels')
        .where('OnlyVeg', isEqualTo: true)
        .getDocuments())
        .documents.forEach((element) {
      itemList.add(element.data());
    });*/

    CollectionReference foodMonkey = FirebaseFirestore.instance
        .collection('Hotels')
        .where('OnlyVeg', isEqualTo: true);

    List itemList = [];
    try {
      await foodMonkey.getDocuments().then((querySnapShot) {
        querySnapShot.documents.forEach((element) {
          itemList.add(element.data());
        });
      });
      return itemList;
    } catch (e) {
      print(e.toString());
    }
  }
}
