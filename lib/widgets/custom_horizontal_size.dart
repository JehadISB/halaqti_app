import 'package:flutter/material.dart';

class CustomHorizontalSize extends StatelessWidget {
  const CustomHorizontalSize({super.key, this.width});
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 15,
    );
  }
}
