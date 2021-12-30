import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../src.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ToDoListModel> _toDoList = [];

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
          backgroundColor: const Color(0xFFEEEEEE),
          centerTitle: true,
          title: Text(
            'Tarefas',
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          actions: const []),
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 160, top: 80),
                child: Text(
                  "Nova Tarefa",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 9.0,),
                child: ToDoListFormComponent(_addToDoList),
              )
            ],
          ),
        ),
      ),
      body: SizedBox(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: Column(
            children: [
              ToDoListComponent(_toDoList),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => globalKey.currentState!.openEndDrawer(),
        backgroundColor: const Color(0xFF00E676),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _addToDoList(CircleAvatar icone, String title, String descricao,
      DateTime date, TimeOfDay time) {
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
}
