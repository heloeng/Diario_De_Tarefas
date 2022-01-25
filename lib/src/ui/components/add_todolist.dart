import 'dart:math';

import 'package:flutter/material.dart';
import '../../src.dart';

import 'package:flutter/material.dart';

class AddTodolist extends StatefulWidget {
  @override
  _AddTodolistState createState() => _AddTodolistState();
}

class _AddTodolistState extends State<AddTodolist> {
  final List<ToDoListModel> toDoList = [];

  addToDoList(CircleAvatar icone, String title, String descricao, DateTime date,
      TimeOfDay time) {
    final List<ToDoListModel> _toDoList = [];

    final newToDoList = ToDoListModel(
      id: Random().nextDouble().toString(),
      icone: icone,
      title: title,
      descricao: descricao,
      date: date,
      time: time,
    );

    setState(
      () {
        _toDoList.add(newToDoList);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ToDoListFormComponent(addToDoList);
  }
}
