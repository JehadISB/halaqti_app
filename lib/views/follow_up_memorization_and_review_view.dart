import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:halaqti_app/widgets/custom_horizontal_size.dart';
import 'package:halaqti_app/widgets/custom_text_form_field.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class FollowUpMemorizationAndReviewView extends StatelessWidget {
  const FollowUpMemorizationAndReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const CustomVerticalSize(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("اليوم"),
              Text("التاريخ"),
            ],
          ),
          const CustomVerticalSize(),
          const Text("اسم الطالب : علي أبوبكر سالم "),
          const CustomVerticalSize(),
          Container(
              color: KSecondryColor.withOpacity(0.2),
              child: Row(
                children: [
                  Text("الحفظ"),
                ],
              )),
          CustomVerticalSize(),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("سورة"),
              CustomHorizontalSize(),
              DropdownButton(items: const [
                DropdownMenuItem(
                  // /value: "surahName",
                  child: Text("اسم السورة"),
                )
              ], onChanged: null),
            ],
          ),
          Row(
            children: [
              const Text("من"),
              CustomHorizontalSize(),
              DropdownButton(items: const [
                DropdownMenuItem(
                  // /value: "fromVerse",
                  child: Text("رقم الآية"),
                )
              ], onChanged: null),
              CustomHorizontalSize(),
              const Text("إلى"),
              CustomHorizontalSize(),
              DropdownButton(items: const [
                DropdownMenuItem(
                  // /value: "fromVerse",
                  child: Text("رقم الآية"),
                )
              ], onChanged: null),
            ],
          ),
          Row(
            children: [],
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
