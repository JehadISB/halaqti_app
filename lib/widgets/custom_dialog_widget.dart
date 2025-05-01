import 'package:flutter/material.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key, required this.title, required this.subtitle});
   final String title;
   final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Image.asset("assets/cross_mark_error.png",width: 72,),
            CustomVerticalSize(),
            Text(title,style: TextStyle(fontSize: 24,color: Colors.red,),),
            CustomVerticalSize(),
            Text(subtitle,style: TextStyle(fontSize: 16),),
            CustomVerticalSize(height: 30,),

          ],
        ),
      ),
    );
  }
}
