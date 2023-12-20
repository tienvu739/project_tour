import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<bool> doLogin(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}