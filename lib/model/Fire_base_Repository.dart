

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_tour/data/hotel_model.dart';


class FirebaseRepository {

Future<List<HotelModel>> getHotels() async {

FirebaseFirestore db = FirebaseFirestore.instance;


QuerySnapshot snapshot = await db.collection("hotels").get();


List<HotelModel> hotels = [];


for (DocumentSnapshot document in snapshot.docs) {

HotelModel hotel = HotelModel.fromDocument(document);


  hotels.add(hotel);
}

// Trả về danh sách các bài đăng
return hotels;
}
}