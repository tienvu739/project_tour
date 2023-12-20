import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_tour/model/hotels.dart';

class HotelModel {
  HotelModel({
    required this.id,
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.numberOfReview,
    required this.price,
  });

  final String id;
  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final int numberOfReview;
  final int price;

  factory HotelModel.fromDocument(DocumentSnapshot doc) {
    // Chuyển đổi dữ liệu từ Firebase thành đối tượng HotelModel
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return HotelModel(
      id: data['id'],
      hotelImage: data['hotelImage'].toString(),
      hotelName: data['hotelName'].toString(),
      location: data['location'].toString(),
      awayKilometer: data['awayKilometer'].toString(),
      numberOfReview: data['numberOfReview'].toInt(),
      star: data['star'].toDouble(),
      price: data['price'].toInt(),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<HotelModel>> getHotels() async {
    QuerySnapshot querySnapshot = await _firestore.collection('hotels').get();
    return querySnapshot.docs.map((doc) => HotelModel.fromDocument(doc)).toList();
  }
}
