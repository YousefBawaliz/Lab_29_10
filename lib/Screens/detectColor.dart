import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'LogInScreen.dart';

class DetectColorScreen extends StatefulWidget {
  @override
  _DetectColorScreenState createState() => _DetectColorScreenState();
}

class _DetectColorScreenState extends State<DetectColorScreen> {
  String color = 'white';
  Color bgColor = Colors.white;
  String usertype = '';

  @override
  void initState() {
    super.initState();
    _checkColor();
  }

  void _checkColor() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      color = snap['color'];
    });

    if (color == 'red') {
      ChooseColor(Colors.red);
    } else if (color == 'blue') {
      ChooseColor(Colors.blue);
    } else if (color == 'green') {
      ChooseColor(Colors.green);
    } else if (color == 'mix') {
      ChooseColor(Color.alphaBlend(
        Colors.red,
        Colors.green,
      ));
    }
  }

  void ChooseColor(Color color) {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        bgColor = color;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RadioListTile(
                value: "User",
                groupValue: usertype,
                title: const Text("User"),
                onChanged: (value) {
                  setState(() {
                    usertype = value.toString();
                  });
                },
              ),
              RadioListTile(
                value: "Admin",
                groupValue: usertype,
                title: const Text("Admin"),
                onChanged: (value) {
                  setState(() {
                    usertype = value.toString();
                  });
                },
              ),
              ElevatedButton(onPressed: () {}, child: Text("Go to View page"))
            ],
          ),
        ),
      ),
    );
  }
}
