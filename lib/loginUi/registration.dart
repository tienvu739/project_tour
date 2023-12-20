import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tour/Screens/main.dart';
import 'package:project_tour/loginUi/login.dart';

import '../core/color_palatte.dart';
import '../core/dimension_constants.dart';

class registration extends StatefulWidget {
  const registration({super.key});

  static const routeName = "regis";

  @override
  State<registration> createState() => _registrationState();
}

class _registrationState extends State<registration> {

  String _email = '';
  String _password = '';
  String _name = '';

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
              "Register",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.primaryColor),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              onChanged: (value){
                _name = value;
              },
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: kMinPadding,
            ),
            TextField(
              onChanged: (value){
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
              onChanged: (value){
                _password = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: kMinPadding,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Re-enter password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: kMediumPadding,
            ),
            GestureDetector(
              onTap: () async {
                try{

                  final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
                  final user = userCredential.user;
                  final databaseReference = FirebaseDatabase.instance.reference().child("users/${user?.uid}");
                  await databaseReference.set({
                    "name": _name,
                    "email": _email,
                    // Add other user data fields
                  });
                  Navigator.of(context).pushNamed(main_app.routeName);

                }on FirebaseAuthException catch (e){
                  print("loi");
                }
                ;
              },
              child: Container(
                height: 46,
                width: 160,
                decoration: BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Register",
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
                  Text("Bạn đã có tài khoản?"),
                  TextButton(onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  }, child: Text('Login'))
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
