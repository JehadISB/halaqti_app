// in the name of allah the most gracious the most merciful
import 'package:flutter/material.dart';
import 'package:halaqti_app/views/attendance_view.dart';
import 'package:halaqti_app/views/home_view.dart';
import 'package:halaqti_app/views/students.dart';

void main() {
  runApp(const HalaqtiApp());
}

class HalaqtiApp extends StatelessWidget {
  const HalaqtiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendanceView(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Alexandria"),
    );
  }
}
