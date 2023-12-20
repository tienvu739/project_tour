import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_tour/Screens/hotel_detail.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/data/hotel_model.dart';
import 'package:project_tour/helpers/assets.dart';
import 'package:project_tour/helpers/image_helper.dart';
import 'package:project_tour/model/hotels.dart';
import 'package:project_tour/widget/button_widget.dart';
import 'package:project_tour/widget/dashline.dart';

class ItemHotels extends StatelessWidget {
  const ItemHotels({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(hotelModel.hotelImage,
                radius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding),
                    topRight: Radius.circular(kDefaultPadding))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(Assets.location,
                        width: 20, height: 20),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.location,
                    ),
                    Expanded(
                        child: Text(
                      ' - ${hotelModel.awayKilometer} form destination',
                      style: TextStyle(color: ColorPalette.subTitleColor),
                      maxLines: 1,
                    )),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(Assets.star,
                        height: 20, width: 20),
                    SizedBox(
                      width: kMinPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                    ),
                    Text(
                      ' - ${hotelModel.numberOfReview} review',
                      style: TextStyle(color: ColorPalette.subTitleColor),
                    ),
                  ],
                ),
                DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${hotelModel.price} VND',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: kMinPadding,
                        ),
                        Text(
                          '/night',
                        ),
                      ],
                    )),
                    Expanded(
                        child: button_widget(
                      title: 'Book a room',
                      ontap: () {
                        var arguments =
                        {
                          'hotelImage': hotelModel.hotelImage,
                          'hotelName': hotelModel.hotelName,
                          'location': hotelModel.location,
                          'awayKilometer': hotelModel.awayKilometer,
                          'numberOfReview': hotelModel.numberOfReview,
                          'star': hotelModel.star,
                          'price': hotelModel.price,
                        };
                        Navigator.pushNamed(context, hotelDetail.routeName,arguments: arguments);
                      },
                    ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
