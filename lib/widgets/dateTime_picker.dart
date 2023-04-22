import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void dateTimePicker1(BuildContext context,bool isStart, Function(bool isStart, DateTime value) onTap) async {
  Get.log(isStart.toString());
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: Get.height * 0.4,
          child: CupertinoDatePicker(
            backgroundColor: Colors.white,
            mode: CupertinoDatePickerMode.time,
            onDateTimeChanged: (value) => onTap( isStart, value),
            initialDateTime: DateTime.now(),
            use24hFormat: true,
            minimumYear: 2000,
            maximumYear: 3000,
          ),
        );
      });
}