// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ParentService {
  static String baseURL = "http://10.0.2.2:8000";
  static storeUser(
    String stdname,
    // String parname,
    String email,
    String mobile,
    String altermobile,
    String stdclass,
    String birth,
    String gender,
    String address,
    String password,
  ) async {
    // print(name);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var response =
        await http.post(Uri.parse("$baseURL/api/parent/register"), body: {
      "stdname": stdname,
      // "parname": parname,
      "email": email,
      "mobile": mobile,
      "altermobile": altermobile,
      "birth": birth,
      "stdclass": stdclass,
      "gender": gender,
      "address": address,
      "password": password,
    }, headers: {
      'Authorization': 'Bearer $token'
    });
    // print(response.body.toString());
    var data = jsonDecode(response.body);
    // print(data);

    return data;
    // print(response.body);
  }

  static Future<List> getAllParent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var response = await http.get(Uri.parse("$baseURL/api/parent"), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error!");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static getSingleParent(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    // try {
    var response = await http
        .get(Uri.parse("http://10.0.2.2:8000/api/showpar/$id"), headers: {
      'Authorization': 'Bearer $token',
    });

    return jsonDecode(response.body);
    // print(response.body);
  }

  static updateParent(
    int parentId,
    String name,
    // String parname,
    String email,
    String mobile,
    String altermobile,
    String clas,
    String birth,
    String gender,
    String address,
    String password,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var response = await http.post(
      Uri.parse("$baseURL/api/parent/update"),
      body: {
        "id": parentId.toString(),
        "stdname": name,
        // "parname": parname,
        "email": email,
        "mobile": mobile,
        "altermobile": altermobile,
        "birth": birth,
        "stdclass": clas,
        "gender": gender,
        "address": address,
        "password": password,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    // print(response.body.toString());
    var data = jsonDecode(response.body);
    // print(data);

    return data;
  }

  static deleteParent(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var response =
        await http.get(Uri.parse("$baseURL/api/parent/delete/$id"), headers: {
      'Authorization': 'Bearer $token',
    });

    // print(response.body.toString());
    return jsonDecode(response.body);
  }
}
