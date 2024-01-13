

import 'package:flutter/material.dart';



class DatePickerUtil {

   Future<DateTime?> showDatePick(BuildContext context) async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    return pickedDate;
  }
}