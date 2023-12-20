import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email,String pass) async
  {
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pass);
      print('dang ky thanh cong');

    }on FirebaseAuthException catch (e){
      print(e.message);
    }
  }

}