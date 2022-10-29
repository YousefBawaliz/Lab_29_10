import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lablab/Screens/LogInScreen.dart';
import 'package:lablab/Screens/SignUpScreen.dart';
import 'package:lablab/Screens/ViewPage.dart';
import 'package:lablab/Screens/detectColor.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return SignUpPage();
    } else {
      return Login_screen();
    }
  }
}
