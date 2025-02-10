import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/attendance_view_body.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_bottom_navigation_bar.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: attendanceViewBody(
        dateTime: DateTime.now(),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("حفظ"),
        backgroundColor: KMainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
