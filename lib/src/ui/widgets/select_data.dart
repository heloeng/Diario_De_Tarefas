import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/controllers/talk_controller.dart';
import 'package:teste/controllers/user_controller.dart';

void selectData({context}) {
  
  late final talkController = Provider.of<TalkController>(
    context,
    listen: false,
  );

  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2025),
  ).then(
    (pickedDate) {
      if (pickedDate == null) {
        return;
      }

      talkController.selectDate(pickedDate);
    },
  );
}
