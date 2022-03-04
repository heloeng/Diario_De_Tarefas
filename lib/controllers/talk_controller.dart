import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:teste/src/src.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class TalkController extends ChangeNotifier {
  DateTime dateSelect = DateTime.now();
  TimeOfDay timeSelect = TimeOfDay.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  String selectedIcon = "";
  String idParaDelecao = '';
  String idSelectedTask = '';
  String idUser = '';

  bool isLoading = false;

  ToDoListModel? selectedModel;
  int selectIndex = 0;

  final tasksList = <ToDoListModel>[];

/*
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
        backgroundColor: AppColors.hexachromeBlack),
  ];
  */

  final avatarList = [
    'assets/img01.png',
    'assets/img02.png',
    'assets/img03.png',
    'assets/img04.png',
    'assets/img05.png',
    'assets/img06.png',
  ];

  /*
  final avatarList = [
    CircleAvatar(child: Tab(icon: Image.asset('assets/img01.png'))),
    CircleAvatar(child: Tab(icon: Image.asset('assets/img02.png'))),
    CircleAvatar(child: Tab(icon: Image.asset('assets/img03.png'))),
    CircleAvatar(child: Tab(icon: Image.asset('assets/img04.png'))),
    CircleAvatar(child: Tab(icon: Image.asset('assets/img05.png'))),
    CircleAvatar(child: Tab(icon: Image.asset('assets/img06.png'))),
  ];
*/
  get user => null;

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

  Future<void> addTalk(UserModel model) async {
    if (selectedModel == null) {
      final _task = ToDoListModel(
        user: model.key!,
        title: titleController.text,
        descricao: descricaoController.text,
        date: dateSelect,
        time: time,
        icone: selectedIcon,
        id: const Uuid().v1(),
      );

      final CollectionReference taskFirebase =
          FirebaseFirestore.instance.collection('tasks');
      DocumentReference _doc =
          await taskFirebase.add(json.decode(_task.toJson()));
      _task.id = _doc.id;
      tasksList.add(_task);
    } else {
      final index = tasksList.indexOf(selectedModel!);

      ToDoListModel _todo = ToDoListModel(
        id: idSelectedTask,
        icone: selectedIcon,
        title: titleController.text,
        descricao: descricaoController.text,
        date: dateSelect,
        time: time,
        user: idUser,
      );

      editTalk(_todo);
    }
    titleController.clear();
    descricaoController.clear();

    notifyListeners();
  }

  Future<void> editTalk(ToDoListModel todo) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(idParaDelecao)
        .update(todo.toMap());
  }

  Future<void> deleteTalk(String idParaDelecao) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(idParaDelecao)
        .delete();
  }

  void loadTaks(UserModel model) async {
    isLoading = true;
    FirebaseFirestore _firebase = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> tasks = await _firebase
        .collection('tasks')
        .where('user', isEqualTo: model.key)
        .get();
    List<ToDoListModel> _todoListAll =
        tasks.docs.map((e) => ToDoListModel.fromMap(e.data())).toList();
    tasksList.clear();
    tasksList.addAll(_todoListAll);
    isLoading = false;
    notifyListeners();
  }
}
