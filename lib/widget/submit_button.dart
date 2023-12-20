// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_tour/Screens/home.dart';
import 'package:project_tour/Screens/intro.dart';
import 'package:project_tour/core/color_palatte.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const SubmitButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.white.withOpacity(0.25),
            offset: Offset(0, 0),
            blurRadius: 2,
            spreadRadius: 1)
      ]),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide.none)),
              backgroundColor: MaterialStateProperty.all<Color>(
                ColorPalette.dividerColor,
              )),
          onPressed: (){
            Navigator.of(context).pushNamed(homeScreen.routeName);
          },
          child: Text(title,
              style: TextStyle(
                fontSize: 24,
                color: ColorPalette.text1Color,
                fontWeight: FontWeight.w600,
              ))),
    );
  }
}
