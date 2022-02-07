import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/data/model/to_do_list_model.dart';
import 'package:teste/src/ui/theme/app_colors.dart';
import 'package:teste/src/ui/widgets/icon_widget.dart';

class TalkController extends ChangeNotifier {
  DateTime dateSelect = DateTime.now();
  TimeOfDay timeSelect = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  CircleAvatar selectedIcon = const CircleAvatar();
  int selectIndex = 0;

  final tasks = <ToDoListModel>[];

  final avatarList = [
    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.shoppingBasket),
        backgroundColor: AppColors.orange),
    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.basketballBall),
        backgroundColor: AppColors.pink),
    CircleAvatar(
        child: IconWidget(appcolors: Icons.location_on_outlined),
        backgroundColor: AppColors.blue),
    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.wineGlass),
        backgroundColor: AppColors.bluelight),
    CircleAvatar(
        child: IconWidget(appcolors: Icons.fitness_center_sharp),
        backgroundColor: AppColors.purple),
    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.bookReader),
        backgroundColor: AppColors.hexachrome_black),
  ];

  void selecionarIcone(int index) {
    selectedIcon = avatarList[index];
    selectIndex = index;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    dateSelect = date;
  }

  void selectTime(TimeOfDay time) {
    timeSelect = time;
  }


  Future<void> addTalk() async {

    final _task = ToDoListModel(
      title: titleController.text,
      descricao: descricaoController.text,
      date: dateSelect,
      time: time,
      icone: selectedIcon,
      id: '',
    );
    tasks.add(_task);
    titleController.clear();
    descricaoController.clear();

    final CollectionReference taskFirebase =
        FirebaseFirestore.instance.collection('tasks');

    DocumentReference _doc =
        await taskFirebase.add(json.decode(_task.toJson()));

    notifyListeners();
  }
}
