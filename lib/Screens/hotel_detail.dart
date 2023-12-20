import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/data/hotel_model.dart';
import 'package:project_tour/helpers/assets.dart';
import 'package:project_tour/helpers/image_helper.dart';
import 'package:project_tour/widget/button_widget.dart';

class hotelDetail extends StatefulWidget {
  const hotelDetail({super.key});

  static const String routeName = 'hotelDetail';

  @override
  State<hotelDetail> createState() => _hotelDetailState();
}

class _hotelDetailState extends State<hotelDetail> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String hotelImage = arguments['hotelImage'];
    String hotelName = arguments['hotelName'];
    String location = arguments['location'];
    String awayKilometer = arguments['awayKilometer'];
    int numberOfReview = arguments['numberOfReview'];
    double star = arguments['star'];
    int price = arguments['price'];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: ImageHelper.loadFromAsset(hotelImage, fit: BoxFit.fill)),
          Positioned(
              top: kMediumPadding * 3,
              left: kMediumPadding,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.white,
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              )),
          Positioned(
              top: kMediumPadding * 3,
              right: kMediumPadding,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.heart_broken,
                    color: Colors.red,
                  ),
                ),
              )),
          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.3,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kDefaultPadding * 2),
                          topRight: Radius.circular(kDefaultPadding * 2))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(kItemPadding)),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Expanded(
                          child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            children: [
                              Text(
                                hotelName,
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                              Spacer(),
                              Text(
                                '\$${price}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('/night')
                            ],
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
                              Text(location)
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(Assets.star,
                                  width: 20, height: 20),
                              SizedBox(
                                width: kMinPadding,
                              ),
                              Text('${star}/5'),
                              Text('(${numberOfReview})')
                            ],
                          ),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            "Infomation",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                              'The hotel has a convenient geographical location for moving to the airport and commercial centers. The hotel has a total of 333 rooms for standard and deluxe guests. The rooms are beautifully designed and refined. Each room has basic equipment such as television, air conditioner, refrigerator, hair dryer, … The space at the hotel is extremely clean and cool.'),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(Assets.map),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                              'The hotel has a convenient geographical location for moving to the airport and commercial centers. The hotel has a total of 333 rooms for standard and deluxe guests. The rooms are beautifully designed and refined. Each room has basic equipment. '),
                          SizedBox(
                            height: kDefaultPadding,
                          ),
                          button_widget(title: 'Seclet room')
                        ],
                      ))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
