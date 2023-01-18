// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static String baseURL = "http://10.0.2.2:8000";
  static loginUser(String email, String password) async {
    final prefss = await SharedPreferences.getInstance();
    final response = await http.post(
      Uri.parse("$baseURL/api/login"),
      body: {
        'email': email,
        'password': password,
      },
    );
    // print(response.body);
    var data = jsonDecode(response.body);
    // print(data);
    if (data['isLogin'] == true) {
      await prefss.setString('token', data['token'].toString());
      await prefss.setString('user_id', data['id'].toString());
      await prefss.setString('isAuthenticated', 'true');
      await prefss.setString('name', data['data']['stdname']);
      await prefss.setString('email', data['data']['email']);
      if (data['data']['user_type'] == 2) {
        Map resp = {
          "isLogin": true,
          "userType": "student",
        };
        return resp;
      } else if (data['data']['user_type'] == 3) {
        Map resp = {
          "isLogin": true,
          "userType": "parent",
        };
        return resp;
      } else {
        Map resp = {
          "isLogin": true,
          "userType": "admin",
        };
        return resp;
      }
    } else {
      Map resp = {
        "isLogin": false,
        "userType": null,
      };
      return resp;
    }
  }
}
