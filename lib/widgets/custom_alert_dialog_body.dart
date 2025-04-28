import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_text_form_field.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class CustomAlertDialogBody extends StatelessWidget {
  const CustomAlertDialogBody({
    super.key,
    required this.textBtn,
    this.color,
  });
  final String textBtn;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: (MediaQuery.of(context).size.height) * 0.5,
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              const CustomTextFormField(
                icon: Icons.person,
                hintText: "اسم الطالب",
              ),
              CustomVerticalSize(),
              const CustomTextFormField(
                icon: Icons.school,
                hintText: "المرحلة الدراسية",
              ),
              CustomVerticalSize(),
              const CustomTextFormField(
                icon: Icons.event,
                hintText: "العمر",
                keyboardType: TextInputType.number,
              ),
              CustomVerticalSize(),
              const CustomTextFormField(
                icon: Icons.contact_phone,
                hintText: "جوال ولي الأمر",
                keyboardType: TextInputType.number,
              ),
              CustomVerticalSize(),
              const CustomTextFormField(
                icon: Icons.call,
                hintText: "هاتف المنزل",
                keyboardType: TextInputType.number,
              ),
              CustomVerticalSize(),
              git checkout -b branch-name

              const CustomTextFormField(
                icon: Icons.auto_stories,
                hintText: "عدد الأجزاء",
                keyboardType: TextInputType.number,
              ),
              CustomVerticalSize(),
              const CustomTextFormField(
                icon: Icons.calendar_month,
                hintText: "سنة التسجيل",
                keyboardType: TextInputType.datetime,
              ),
              CustomVerticalSize(),
              // const Spacer(),
              CustomButton(
                text: textBtn,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
