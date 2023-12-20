import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_tour/widget/appBar.dart';
import 'package:project_tour/widget/item_hotel.dart';

import '../data/hotel_model.dart';
import '../helpers/assets.dart';
import '../model/Fire_base_Repository.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  static const routeName = 'HotelScreen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {

  final List<HotelModel> listHotel =[
    HotelModel(
      id: '',
      hotelImage: Assets.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 1449900,
    ),
    HotelModel(
      id: '',
      hotelImage: Assets.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 5900000,
    ),
    HotelModel(
      id: '',
      hotelImage: Assets.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 7499000,
    ),
    HotelModel(
      id: '',
      hotelImage: Assets.hotel4,
      hotelName: 'Benjin hotel',
      location: 'Benjin',
      awayKilometer: '7000.1 km',
      star: 2.8,
      numberOfReview: 1234,
      price: 5900000,
    ),
    HotelModel(
      id: '',
      hotelImage: Assets.hotel5,
      hotelName: 'NewYord hotel',
      location: 'NewYord',
      awayKilometer: '6400.1 km',
      star: 4.5,
      numberOfReview: 1234,
      price: 80000000,
    ),
    HotelModel(
      id: '',
      hotelImage: Assets.hotel6,
      hotelName: 'TP HCM hotel',
      location: 'VietNam',
      awayKilometer: '1.1 km',
      star: 4.8,
      numberOfReview: 1234,
      price: 7499000,
    ),
  ];


  @override

  Widget build(BuildContext context) {
    return appbar(
        title: Text('Hotels'),
        child: SingleChildScrollView(
          child: Column(
            children:
            listHotel.map((e) => ItemHotels(hotelModel: e)).toList(),
          ),
        )
    );
  }
}
