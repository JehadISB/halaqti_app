import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:halaqti_app/widgets/custom_date_picker.dart';
import 'package:halaqti_app/widgets/custom_grid_view_builder.dart';

class AllStudentsView extends StatelessWidget {
  const AllStudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          CustomDatePicker(dateTime: DateTime.now()),
          Expanded(
              child: ListView(
            children: [
              CustomGridViewBuilder(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisExtent: 5,
                mainAxisSpacing: 5,
                cardTitle: "أحمد أبوبكر علي",
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
