import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context, {required String message,Color? backgroundColor, int? secondsDuration}) {


  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message),
      backgroundColor:backgroundColor ,
      duration:Duration(seconds:secondsDuration??3 ) ,));
}
