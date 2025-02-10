import 'package:flutter/material.dart';
import 'package:halaqti_app/methods/show_date_picker.dart';
import 'package:halaqti_app/widgets/custom_horizontal_size.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              hintStyle: TextStyle(fontSize: 12, fontFamily: "NotoNaskhArabic"),
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
    );
  }
}
