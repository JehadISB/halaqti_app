import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_date_picker.dart';
import 'package:halaqti_app/widgets/custom_grid_view_builder.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class AllStudentsViewBody extends StatelessWidget {
  const AllStudentsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomVerticalSize(),
        CustomDatePicker(dateTime: DateTime.now()),
        Expanded(
            child: ListView(
          children: const [
            CustomVerticalSize(),
            CustomGridViewBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisExtent: 180,
              mainAxisSpacing: 5,
              itemCount: 10,
              cardTitle: "أحمد أبوبكر علي",
            ),
          ],
        ))
      ],
    );
  }
}
