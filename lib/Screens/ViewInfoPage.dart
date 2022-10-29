import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewInfoPage extends StatefulWidget {
  const ViewInfoPage({super.key});

  @override
  State<ViewInfoPage> createState() => _ViewInfoPageState();
}

class _ViewInfoPageState extends State<ViewInfoPage> {
  
 final CollectionReference _students =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("FireStore"),
        centerTitle: true,
      ),
      //Use stream builder to get the updated data in real time immedietly
      body: StreamBuilder(
        stream: _students
            .snapshots(), //define the desired firestore collection as the target stream to get presistent data from it

        //streamsnapshot will have all the data available in our database (firestore collection)

        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final DocumentSnaphot documentSnapshot = streamSnapshot.data!.docs[index];
          if (streamSnapshot.hasData) {
            
            return Center(
              child: Container(

                
                // child: ListView.builder(
                //   itemCount: streamSnapshot.data!.docs
                //       .length, //since streamsnapshot refers to the collection, we specify the itemcount as the number of documnets we have in our firestore collection

                //   itemBuilder: (BuildContext context, int index) {
                //     //access the data from the document (fields) and save them in a documnet object(DocumentSnaphot)
                //     final DocumentSnapshot documentSnapshot =
                //         streamSnapshot.data!.docs[index];


                  //   return Card(
                  //     margin: EdgeInsets.all(8),
                  //     child: ListTile(
                  //       // access the fields using their property; which are 'name' and 'price' which we created earlier
                  //       title: Text(documentSnapshot['Name']),
                  //       subtitle:
                  //           Text(documentSnapshot['StudentNumber'].toString()),
                  //       trailing: SizedBox(
                  //         width: 100,
                  //         child: Row(),
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
            ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  
  }
}
