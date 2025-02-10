import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_text_form_field.dart';

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
      height: (MediaQuery.of(context).size.height) * 0.5,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const CustomTextFormField(
              icon: Icons.person,
              hintText: "اسم الطالب",
            ),
            const CustomTextFormField(
              icon: Icons.person,
              hintText: "المرحلة الدراسية",
            ),
            const CustomTextFormField(
              icon: Icons.person,
              hintText: "عدد الأجزاء",
              keyboardType: TextInputType.number,
            ),
            const CustomTextFormField(
              icon: Icons.person,
              hintText: "سنة التسجيل",
              keyboardType: TextInputType.datetime,
            ),
            const Spacer(),
            CustomButton(
              text: textBtn,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
