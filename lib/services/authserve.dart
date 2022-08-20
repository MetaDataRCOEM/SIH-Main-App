import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: unused_import
import 'package:sih_main/MSEProfile.dart';

class AuthService {
  Dio dio = new Dio();

  auth(username, ID, pass) async {
    try {
      return await dio.post(
        "https://sihbackendflutter.herokuapp.com/authenticate",
        data: {
          "username": username,
          "mseID": ID,
          "password": pass,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  auth2(username, ID, pass) async {
    try {
      return await dio.post(
        "https://sihbackendflutter.herokuapp.com/authenticate",
        data: {
          "username": username,
          "empID": ID,
          "password": pass,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
  // getInfo(token) async {
  //   try {
  //     dio.options.headers['authorization'] = "Bearer $token";
  //     return await dio.get("https://sihbackendflutter.herokuapp.com/getinfo");
  //   } on DioError catch (e) {
  //     var UserData = e.response?.data['msg'];

  //     Fluttertoast.showToast(
  //       msg: e.response?.data['msg'],
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }
}
