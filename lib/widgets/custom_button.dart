import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
  });
  final void Function()? onTap;
  final String text;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width) * 0.5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color ?? KMainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
