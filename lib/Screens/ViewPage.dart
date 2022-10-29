import 'package:flutter/material.dart';
import 'package:lablab/Screens/ViewInfoPage.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String usertype = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ViewInfoPage();
                      },
                    ));
                  },
                  child: Text("Go to View page"))
            ],
          ),
        ),
      ),
    );
  }
}
