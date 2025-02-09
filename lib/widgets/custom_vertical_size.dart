import 'package:flutter/material.dart';

class CustomVerticalSize extends StatelessWidget {
  const CustomVerticalSize({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 15,
    );
  }
}
