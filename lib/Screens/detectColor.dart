import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:lablab/Screens/ViewInfoPage.dart';

import 'LogInScreen.dart';

class DetectColorScreen extends StatefulWidget {
  @override
  _DetectColorScreenState createState() => _DetectColorScreenState();
}

class _DetectColorScreenState extends State<DetectColorScreen> {
  String color = 'white';
  Color bgColor = Colors.white;
  String usertype = '';

  Color c1 = Colors.blue;
  Color c2 = Colors.red;
  bool isloading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await _checkColor();
  //     setState(() {
  //       isloading = false;
  //     });
  //   });
  // }

  Future<void> _checkColor() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();

    setState(() {
      color = snap['color'];
      if (color == 'red') {
        bgColor = (Colors.red);
      } else if (color == 'blue') {
        bgColor = (Colors.blue);
      } else if (color == 'green') {
        bgColor = (Colors.green);
      } else if (color == 'mix') {
        bgColor = (Color.alphaBlend(
          c1,
          c2,
        ));
      }
    });

    // if (color == 'red') {
    //   ChooseColor(Colors.red);
    // } else if (color == 'blue') {
    //   ChooseColor(Colors.blue);
    // } else if (color == 'green') {
    //   ChooseColor(Colors.green);
    // } else if (color == 'mix') {
    //   ChooseColor(Color.alphaBlend(
    //     c1,
    //     c2,
    //   ));
    // }
    print(bgColor);
  }

  // void ChooseColor(Color color) {
  //   Timer(Duration(milliseconds: 500), () {
  //   //   setState(() {
  //   //     bgColor = color;
  //   //   });
  //   // });
  // }

  void addRole() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser?.uid)
        .update({
      'role': usertype,
    });
  }

// User? user = FirebaseAuth.instance.currentUser;
  final snap = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: snap.get(),
        builder: (context, snapshot) {
          Color mycolor = Colors.white;
          if (snapshot.data!['color'] == 'red') {
            mycolor = (Colors.red);
          } else if (snapshot.data!['color'] == 'blue') {
            mycolor = (Colors.blue);
          } else if (snapshot.data!['color'] == 'green') {
            mycolor = (Colors.green);
          } else if (snapshot.data!['color'] == 'mix') {
            mycolor = (Color.alphaBlend(
              c1,
              c2,
            ));
          }
          print(mycolor);
          return Scaffold(
            backgroundColor: mycolor,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
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
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                addRole();
                                bgColor = Colors.white;
                              });
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ViewInfoPage();
                                },
                              ));
                            },
                            child: Text("Go to View page"))
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
