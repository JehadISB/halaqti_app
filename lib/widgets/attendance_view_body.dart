import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/methods/show_date_picker.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';
import 'package:halaqti_app/widgets/list_spreated_attendance_of_students.dart';
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
        CustomButton(
          onTap: () => ShowDateTime(context: context, dateTime: dateTime),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("عام:${dateTime.year.toString()}"),
              Text("الشهر:${DateFormat("MMMM").format(dateTime)} "),
              Text("اليوم:${DateFormat("EEEE").format(dateTime)}"),
            ],
          ),
        ),
        CustomVerticalSize(),
        Divider(),
        Expanded(child: ListAttendanceStudents())
      ],
    );
  }
}
