import 'package:flutter/material.dart';
import 'package:halaqti_app/methods/show_date_picker.dart';
import 'package:halaqti_app/widgets/custom_date_picker.dart';
import 'package:halaqti_app/widgets/custom_horizontal_size.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';
import 'package:intl/intl.dart';

class attendanceViewBody extends StatelessWidget {
  const attendanceViewBody({
    super.key,
    required this.dateTime,
  });
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        CustomDatePicker(dateTime: dateTime),
        // CustomButton(
        //   onTap: () => ShowDateTime(context: context, dateTime: dateTime),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("عام:${dateTime.year.toString()}"),
              Text("الشهر:${DateFormat("MMMM").format(dateTime)} "),
              Text("اليوم:${DateFormat("EEEE").format(dateTime)}"),
            ],
          ),
        ),
        const CustomVerticalSize(),
        Row(
          children: [
            const Text("تحضير الجميع"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.circle),
              iconSize: 30,
            ),
          ],
        ),
        const Divider(),
        //const Expanded(child: ListAttendanceStudents())
      ],
    );
  }
}
