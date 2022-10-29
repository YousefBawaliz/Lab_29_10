import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../AuthService/firebase_auth_methods.dart';

class ViewInfoPage extends StatefulWidget {
  const ViewInfoPage({super.key});

  @override
  State<ViewInfoPage> createState() => _ViewInfoPageState();
}

class _ViewInfoPageState extends State<ViewInfoPage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  // if (user != null) {
  //   // Name, email address, and profile photo URL
  //   final name = user.displayName;
  //   final email = user.email;
  //   final photoUrl = user.photoURL;
  // }
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  late DocumentReference categoryDetails =
      _users.doc("MH11xb715PPzkNWiq9ef1HCUdka2");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: _users.doc('${currentUser!.uid}').get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          print(currentUser!.uid);
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User-Info: ",
                  style: TextStyle(fontSize: 40, color: Colors.black87),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Color: ${data['color']} ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Email: ${data['email']} ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "userID: ${data['uid']} ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "userID: ${data['role']} ",
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(currentUser!.uid);
                    },
                    child: Text("ok"))
              ],
            ),
            // body: ListView.builder(
            //   itemCount: snapshot.data!.size,
            //   itemBuilder: (BuildContext context, i) {
            //     return Column(
            //       children: [
            //         Text(
            //             "Full Name: ${data['full_name']} ${data['last_name']}"),
            //         Text(
            //             "Full Name: ${data['full_name']} ${data['last_name']}"),
            //       ],
            //     );
            //   },
            // ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


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