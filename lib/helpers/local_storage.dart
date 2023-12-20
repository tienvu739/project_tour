import 'dart:ffi';

import 'package:hive_flutter/adapters.dart';

class localStorage {
  localStorage._internal();
  static final localStorage _storage = localStorage._internal();
  factory localStorage() {
    return _storage;
  }
  late Box<dynamic> hiveBox;

  static initlocalStorage() async {
    _storage.hiveBox = await Hive.openBox("TourApp");
  }

  static dynamic getValue(String key) {
    return _storage.hiveBox?.get(key);
  }

  static setValue(String key, dynamic val) {
    _storage.hiveBox?.put(key, val);
  }
}
