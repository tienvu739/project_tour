import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tour/core/dimension_constants.dart';

class ItemBooking extends StatelessWidget {
  const ItemBooking(
      {super.key, required this.icon, required this.title, required this.dec, this.onTap});


  final String icon;
  final String title;
  final String dec;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
          onTap: onTap,
          child:
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: Row(
              children: [
                Image.asset(icon, height: 30, width: 30,),
                SizedBox(width: kItemPadding,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: kMinPadding,),
                    Text(dec),
                  ],
                )
              ],
            ),
          ));
  }
}
