

import 'package:flutter/material.dart';
import 'package:project_tour/Screens/home.dart';
import 'package:project_tour/Screens/hotel.dart';
import 'package:project_tour/Screens/hotel_detail.dart';
import 'package:project_tour/Screens/hotels_screen.dart';
import 'package:project_tour/Screens/intro.dart';
import 'package:project_tour/Screens/main.dart';
import 'package:project_tour/Screens/select_date.dart';
import 'package:project_tour/Screens/splash_screen.dart';
import 'package:project_tour/loginUi/login.dart';
import 'package:project_tour/loginUi/registration.dart';

final Map<String, WidgetBuilder> route = {
  splash_screen.routeName: (context) => splash_screen(),
  introScreen.routeName: (context) => introScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  homeScreen.routeName: (context) => homeScreen(),
  main_app.routeName: (context) => main_app(),
  hotels_screen.routeName: (context) => hotels_screen(),
  registration.routeName: (context) => registration(),
  SeclectDate.routeName: (context) => SeclectDate(),
  HotelsScreen.routeName: (context) => HotelsScreen(),
  hotelDetail.routeName: (context) => hotelDetail(),
};
