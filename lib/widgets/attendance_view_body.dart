import 'package:flutter/material.dart';
import 'package:halaqti_app/methods/show_date_picker.dart';
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
        Row(
          children: [
            Text("التاريخ"),
            CustomHorizontalSize(),
            Container(
              width: 210,
              height: 40,
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber), // Border color
                    // No border radius means sharp corners
                  ),
                  hintText: "انقر على الأيقونة لفتح التقويم",
                  hintStyle:
                      TextStyle(fontSize: 12, fontFamily: "NotoNaskhArabic"),
                  suffixIcon: IconButton(
                      onPressed: () {
                        ShowDateTime(context: context, dateTime: dateTime);
                      },
                      icon: Icon(Icons.calendar_month)),
                ),
              ),
            ),
            CustomHorizontalSize(),
            IconButton(
                onPressed: () {
                  ShowDateTime(context: context, dateTime: dateTime);
                },
                icon: Icon(Icons.calendar_month)),
          ],
        ),
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
