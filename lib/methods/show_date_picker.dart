import 'package:flutter/material.dart';

void ShowDateTime({required BuildContext context, required DateTime dateTime}) {
  showDatePicker(
          firstDate: DateTime(2020), lastDate: DateTime(2090), context: context)
      .then(
    (value) => dateTime,
  );
}
