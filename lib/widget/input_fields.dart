// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(
      this.textEditingController,
      this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextField(
        obscureText: true,
        controller: textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
            // focusedBorder: UnderlineInputBorder(
            //     borderSide: BorderSide(color: Colors.black)),
            labelText: hintText,
            fillColor: Colors.white54,
            // hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            // contentPadding: EdgeInsets.only(bottom: 40),
            focusColor: Colors.white60
        ),
      ),
    );
  }
}
