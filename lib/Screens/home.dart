import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tour/Screens/main.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../core/color_palatte.dart';
import '../core/dimension_constants.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  static const routeName = "homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          main_app(),
          Container(color: Colors.green,),
          Container(color: Colors.black,),
          Container(color: Colors.red,),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index)
        {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: Colors.grey,
        margin: EdgeInsets.symmetric(
            horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
          SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                size: kDefaultIconSize,
              ),
              title: Text("Home")),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.shopping_cart,
                size: kDefaultIconSize,
              ),
              title: Text("Cart")),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.save,
                size: kDefaultIconSize,
              ),
              title: Text("Booking")),
          SalomonBottomBarItem(
              icon: Icon(
                Icons.account_circle_sharp,
                size: kDefaultIconSize,
              ),
              title: Text("Profile")),
        ],
      ),);
  }
}
