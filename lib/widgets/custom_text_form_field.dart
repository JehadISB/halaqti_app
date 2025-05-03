import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.icon,
    this.hintText,
    this.keyboardType, this.controller, this.colorIcon, this.validator,this.initialValue
  });
  final IconData? icon;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Color? colorIcon;
  final String? Function(String?)? validator;
  final String? initialValue;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      validator: validator,
      // inputFormatters: [
      //   FilteringTextInputFormatter.digitsOnly, // ← يمنع أي شيء غير الأرقام
      // ],
     // initialValue:initialValue ,
      decoration: InputDecoration(
          icon: Icon(icon,color:colorIcon ,),

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
