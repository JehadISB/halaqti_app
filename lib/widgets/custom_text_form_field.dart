import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.hintText,
    this.keyboardType,
  });
  final IconData? icon;
  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(icon: Icon(icon), hintText: hintText),
      keyboardType: keyboardType,
    );
  }
}
