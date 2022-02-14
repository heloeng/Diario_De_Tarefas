import 'package:teste/src/src.dart';

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
