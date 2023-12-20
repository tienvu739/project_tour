import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:project_tour/Screens/main.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/loginUi/registration.dart';

import '../model/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = "loginscreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColor),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              onChanged: (value)
              {
                _email = value;
              },
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: kMinPadding,
            ),
            TextField(
              onChanged: (value)
              {
                _password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            GestureDetector(
              onTap: () async {
                try{
                  _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
                  Navigator.of(context).pushNamed(main_app.routeName);
                }on FirebaseAuthException catch (e){
                  print("loi");
                }
              },
              child: Container(
                height: 46,
                width: 160,
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: kDefaultPadding,
                        color: ColorPalette.yellowColor),
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                children: [
                  Text("Bạn chưa có tài khoản?"),
                  TextButton(onPressed: () {
                    Navigator.of(context).pushNamed(registration.routeName);
                  }, child: Text('Register'))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
