import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';

class ToDoListComponent extends StatefulWidget {
  final List<ToDoListModel> toDoList;

  const ToDoListComponent(this.toDoList, {Key? key}) : super(key: key);

  @override
  State<ToDoListComponent> createState() => _ToDoListComponentState();
}

class _ToDoListComponentState extends State<ToDoListComponent> {
  final tasksList = <ToDoListModel>[];
  late final talkController = Provider.of<TalkController>(
    context,
    listen: false,
  );

  late final UserController userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  get time => null;

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('tasks')
            .where('user', isEqualTo: userController.user!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
/*
          snapshot.data!.docs.forEach((element) {
            print('DADOS snapshot => ${element.data()}');
          });
*/
          return SizedBox(
            height: 500,
            child: ListView.builder(
              // itemCount: talkController.tasksList.length,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) {
                //final tr = talkController.tasksList[index];
                ToDoListModel toDoModel = ToDoListModel.fromJson(
                    jsonEncode(snapshot.data!.docs[index].data()));
                String idParaDelecao = snapshot.data!.docs[index].id;

                return GestureDetector(
                  child: Card(
                    elevation: 10,
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 25,
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.95,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 23,
                            child: toDoModel.icone,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    toDoModel.title,
                                    style: TextStyles.trTitleComponent,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        DateFormat('dd MMM')
                                            .format(toDoModel.date),
                                        style: TextStyles.dateFormatComponent,
                                      ),
                                      Text(
                                        toDoModel.time.format(
                                          context,
                                        ),
                                        style: TextStyles.trTimeComponent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () async {
                                await talkController.deleteTalk(idParaDelecao);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              }),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () async {
                              talkController.selectedModel = toDoModel;
                              if (talkController.selectedModel != null) {
                                talkController.idParaDelecao = idParaDelecao;
                                talkController.idSelectedTask = toDoModel.id;
                                talkController.idUser = toDoModel.user;
                                talkController.titleController.text =
                                    talkController.selectedModel!.title;
                                talkController.descricaoController.text =
                                    talkController.selectedModel!.descricao;
                                int indice = talkController.avatarList.indexOf(
                                    talkController.selectedModel!.icone);
                                talkController.selectIndex = indice;
                                talkController.selectedIcon =
                                    talkController.selectedModel!.icone;
                              }
                              globalKey.currentState!.openEndDrawer();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () => alertShowTodo(context, toDoModel),
                );
              },
            ),
          );
        });
  }

  DateTime convertTimeOfDayToDateTime(TimeOfDay t) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }
}


/*
 @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 520,
      // child: widget.toDoList.isEmpty
      child: talkController.tasksList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "Agendar tarefas",
                      style: GoogleFonts.blackOpsOne(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color(0xFFFB6C34),
                        ),
                      ),
                      // style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            )
          : (talkController.isLoading)
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: talkController.tasksList.length,
                    itemBuilder: (ctx, index) {
                      final tr = talkController.tasksList[index];

                      return GestureDetector(
                        child: Card(
                          elevation: 10,
                          margin: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 25,
                          ),
                          child: SizedBox(
                            width: screenWidth * 0.95,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  child: tr.icone,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tr.title,
                                          style: TextStyles.trTitleComponent,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              DateFormat('dd MMM')
                                                  .format(tr.date),
                                              style: TextStyles
                                                  .dateFormatComponent,
                                            ),
                                            Text(
                                              tr.time.format(
                                                context,
                                              ),
                                              style: TextStyles.trTimeComponent,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      await talkController.deleteTalk(tr);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
                                    }),
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    talkController.selectedModel = tr;
                                    if (talkController.selectedModel != null) {
                                      talkController.titleController.text =
                                          talkController.selectedModel!.title;
                                      talkController.descricaoController.text =
                                          talkController
                                              .selectedModel!.descricao;
                                      int indice = talkController.avatarList
                                          .indexOf(talkController
                                              .selectedModel!.icone);
                                      talkController.selectIndex = indice;
                                      talkController.selectedIcon =
                                          talkController.selectedModel!.icone;
                                    }
                                    globalKey.currentState!.openEndDrawer();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => alertShowTodo(context, tr),
                      );
                    },
                  ),
                ),
    );
  }
 */