import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/core/dimension_constants.dart';

class button_widget extends StatelessWidget {
  const button_widget({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient: Gradients.defaultGradientBackground,
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ));
  }
}
