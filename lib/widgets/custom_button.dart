import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width) * 0.5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: KMainColor, borderRadius: BorderRadius.circular(30)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("اختر التاريخ"),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.calendar_month),
          ],
        ),
      ),
    );
  }
}
