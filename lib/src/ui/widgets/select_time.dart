import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/controllers/talk_controller.dart';

Future<void> selectTime(BuildContext context) async {
  TimeOfDay timeSelect = TimeOfDay.now();
  late final talkController = Provider.of<TalkController>(
    context,
    listen: false,
  );
  var picker = (await showTimePicker(
    context: context,
    initialTime: timeSelect,
  ))!;

  talkController.selectTime(picker);
}
