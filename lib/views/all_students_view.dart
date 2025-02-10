import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/all_students_view_body.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_bottom_navigation_bar.dart';

class AllStudentsView extends StatelessWidget {
  const AllStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: AllStudentsViewBody(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
