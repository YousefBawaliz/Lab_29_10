import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewInfoPage extends StatefulWidget {
  const ViewInfoPage({super.key});

  @override
  State<ViewInfoPage> createState() => _ViewInfoPageState();
}

class _ViewInfoPageState extends State<ViewInfoPage> {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Text(snapshot.data!.docs['color']),
                Text(snapshot.data!.docs['email']),
                Text(snapshot.data!.docs['uid']),
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
    // return Scaffold(

    //   appBar: AppBar(
    //     title: const Text("FireStore"),
    //     centerTitle: true,
    //   ),
    //   //Use stream builder to get the updated data in real time immedietly
    //   body: StreamBuilder(
    //     stream: _users.snapshots(),

    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.hasData) {
    //         return Container(
    //         child: Column(
    //           children: [

    //           ],
    //         ),
    //       );
    //       }

    //     },
    //   ),
    // );
  }
}
