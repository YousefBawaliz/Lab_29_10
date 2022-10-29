import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lablab/Screens/ViewPage.dart';
import 'package:lablab/Screens/detectColor.dart';

// import 'package:signin_singnup/Screens/AdminPage.dart';
// import 'package:signin_singnup/Screens/splashScreen.dart';
// import 'package:signin_singnup/services/firebase_auth_methods.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'Resetpassword.dart';
import '../AuthService/firebase_auth_methods.dart';
import 'SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//create a sign in function

  void logInFucntion() {
    FirebaseAuthMethods(FirebaseAuth.instance).logInWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  // void forgotpassword(){
  //   FirebaseAuthMethods(FirebaseAuth.instance).
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: _title()),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 1, 24),
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/1.png"))),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffe46b10)),
                    child: const Text('Login'),
                    onPressed: () {
                      logInFucntion();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetectColorScreen(),
                          ));
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Do not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}

Widget _title() {
  return Text("Welcome");
}
