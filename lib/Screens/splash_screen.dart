import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tour/Screens/intro.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/helpers/local_storage.dart';
import 'package:project_tour/loginUi/login.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});
  static String routeName = '/splash_screen';
  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    redirectHomeScreen();
  }

  void redirectHomeScreen() async {
    final ignoreitroScreen =
        localStorage.getValue("ignoreIntroScreem") as bool?;

    await Future.delayed(const Duration(seconds: 2));

    // if (ignoreitroScreen != null && ignoreitroScreen) {
    //   Navigator.of(context).pushNamed(LoginScreen.routeName);
    // // } else {
    //   localStorage.setValue("ignoreIntroScreem", true);
      Navigator.of(context).pushNamed(introScreen.routeName);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaryColor,
      body: Center(
        child: Text(
          "Tour app",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
