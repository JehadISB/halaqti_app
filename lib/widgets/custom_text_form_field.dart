import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.hintText,
    this.keyboardType, this.controller,
  });
  final IconData? icon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      validator:  (value) {
        if (value == null || value.trim().isEmpty) {
          return 'الرجاء إدخال الاسم';
        }
        return null;
      },
      decoration: InputDecoration(
          icon: Icon(icon),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: KMainColor,
              ))),
      keyboardType: keyboardType,
    );
  }
}
