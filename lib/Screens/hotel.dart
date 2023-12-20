import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_tour/Screens/hotels_screen.dart';
import 'package:project_tour/Screens/select_date.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/helpers/assets.dart';
import 'package:project_tour/model/date.dart';
import 'package:project_tour/widget/appBar.dart';
import 'package:project_tour/widget/button_widget.dart';
import 'package:project_tour/widget/item_booking.dart';

import '../data/hotel_model.dart';

class hotels_screen extends StatefulWidget {
  const hotels_screen({super.key});

  static final String routeName = 'hotelScreen';

  @override
  State<hotels_screen> createState() => _hotels_screenState();
}

class _hotels_screenState extends State<hotels_screen> {

  String? dateSelect;

  @override
  Widget build(BuildContext context) {
    return appbar(
      title: Text("hotel"),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBooking(
                icon: Assets.location, title: "Destination", dec: "VietNam",onTap: () {
                },),
            SizedBox(
              height: kMinPadding,
            ),
            ItemBooking(
                icon: Assets.calendar,
                title: "Select Date",
                dec: dateSelect ?? "13 Dec - 25 Dec 2023",
                onTap: () async {
                  final result = await Navigator.of(context).pushNamed(SeclectDate.routeName);
                  if(!(result as List<DateTime>).any((element) => element == null))
                    {
                      dateSelect = '${result[0]?.getStarDate} - ${result[1]?.getEndDate}';
                      setState(() {
                      });
                    }

                  },
                ),
            SizedBox(
              height: kMinPadding,
            ),
            ItemBooking(
                icon: Assets.bed,
                title: "Guest and Room",
                dec: "2 guest, 1 room"),
            button_widget(title: 'Seach',ontap: () {
              Navigator.of(context).pushNamed(HotelsScreen.routeName);
            },)
          ],
        ),
      ),
    );
  }
}
