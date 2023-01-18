// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentService {
  static String baseURL = "http://10.0.2.2:8000";
  static storeUser(
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
    var response =
        await http.post(Uri.parse("$baseURL/api/student/register"), body: {
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
    }, headers: {
      'Authorization': 'Bearer $token',
    });
    // print(email);
    // print(response.body.toString());
    var data = jsonDecode(response.body);
    // print(data);

    return data;
  }

  Future<List> getAllstudent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var response =
          await http.get(Uri.parse("$baseURL/api/student"), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error!");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  static getSingleStudent(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    // try {
    var response = await http.get(Uri.parse("$baseURL/api/show/$id"), headers: {
      'Authorization': 'Bearer $token',
    });

    return jsonDecode(response.body);
    // print(response.body);
  }

  static updateStudent(
    int studentId,
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
      Uri.parse("$baseURL/api/student/update"),
      body: {
        "id": studentId.toString(),
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

  static deleteStudent(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    var response =
        await http.get(Uri.parse("$baseURL/api/student/delete/$id"), headers: {
      'Authorization': 'Bearer $token',
    });
    // print(response.body);
    return jsonDecode(response.body);
  }

  Future<List> getParentDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var response =
          await http.get(Uri.parse("$baseURL/api/parentinfo"), headers: {
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        // print(response.body);
        return jsonDecode(response.body);
      } else {
        return Future.error("Server Error!");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
