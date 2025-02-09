import 'package:flutter/material.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(),
      body: attendanceViewBody(),
    );
  }
}

class attendanceViewBody extends StatelessWidget {
  const attendanceViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
