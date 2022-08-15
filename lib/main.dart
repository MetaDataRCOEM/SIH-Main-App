import 'package:flutter/material.dart';
import 'package:sih_main/CalenderPage.dart';
import 'package:sih_main/EmpImg.dart';
import 'package:sih_main/HomePage.dart';
import 'MSEProfile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserCalenderPage(),
    );
  }
}
