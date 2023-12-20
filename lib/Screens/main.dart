import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tour/Screens/hotel.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/helpers/assets.dart';
import 'package:project_tour/helpers/image_helper.dart';
import 'package:project_tour/widget/appBar.dart';

import 'hotels_screen.dart';

class main_app extends StatefulWidget {
  const main_app({super.key});

  static const routeName = "main_screen";

  @override
  State<main_app> createState() => _main_appState();
}

class _main_appState extends State<main_app> {
  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kDefaultPadding),
            ),
            child: icon,
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return appbar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Chào bạn!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lựa chọn cho chuyến đi chưa?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(
                Icons.add_alert,
                size: kDefaultIconSize,
                color: Colors.white,
              )
            ],
          ),
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(kTopPadding),
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: kDefaultPadding,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kItemPadding)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: kItemPadding)),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildItemCategory(
                    ImageHelper.loadFromAsset(Assets.iconHotel,
                        width: kBottomBarIconSize, height: kBottomBarIconSize),
                    Color(0xffFE9C5E),
                    () {
                      Navigator.of(context).pushNamed(HotelsScreen.routeName);
                    },
                    'Hotels',
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: _buildItemCategory(
                    ImageHelper.loadFromAsset(Assets.iconTour,
                        width: kBottomBarIconSize, height: kBottomBarIconSize),
                    Color(0xffF77777),
                    () {},
                    'Tours',
                  ),
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                  child: _buildItemCategory(
                    ImageHelper.loadFromAsset(Assets.iconAll,
                        width: kBottomBarIconSize, height: kBottomBarIconSize),
                    Color(0x551919FF),
                    () {},
                    'All',
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
