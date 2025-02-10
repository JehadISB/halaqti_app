import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_alert_dialog_body.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:halaqti_app/widgets/students_view_body.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: const StudentsViewBody(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("إضافة طالب جديد"),
              content: CustomAlertDialogBody(
                textBtn: "إضافة طالب",
              ),
            ),
          );
        },
        child: const Icon(Icons.person_add_alt_1),
      ),
    );
  }
}
