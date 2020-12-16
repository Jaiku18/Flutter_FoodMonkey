import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ToBeAdded extends StatelessWidget {
  static const String id = 'ToBeAdded';

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: MaterialButton(
              onPressed: a.adding,
              child: Container(
                height: 100,
                width: 500,
                color: Colors.black12,
                child: Text('hhhh'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

add a = add();

class add {
  adding() {
    String postID = "2";
    CollectionReference colle =
        FirebaseFirestore.instance.collection('/Hotels/4/Menu/');

    Map<String, dynamic> postData = {
      "Amount": "95",
      "Name": "Sambar vada",
      "Desc": "sambar vada served with sambar",
      "image": "UI/sambar vada.PNG"
    };
    colle.doc('6').set(postData);

    print('working');
  }
}
