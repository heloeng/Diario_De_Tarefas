import 'package:flutter/material.dart';
import 'package:teste/src/data/model/toDoList_model.dart';
import 'package:intl/intl.dart';
import 'package:teste/src/ui/components/alertShowTodo.dart';

class ToDoListComponent extends StatefulWidget {
  final List<ToDoListModel> toDoList;

  const ToDoListComponent(this.toDoList, {Key? key})
      : super(key: key);

  @override
  State<ToDoListComponent> createState() =>
      _ToDoListComponentState();
}

class _ToDoListComponentState extends State<ToDoListComponent> {
  get time => null;

  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 520,
      child: widget.toDoList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Insira sua primeira tarefa!!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            )
          : SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: widget.toDoList.length,
                itemBuilder: (ctx, index) {
                  final tr = widget.toDoList[index];

                  return GestureDetector(
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      child: Container(
                        //  color: Colors.red,
                        width: screenWidth * 0.95,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 23,
                              child: tr.icone,
                            ),
                            SizedBox(
                              height: screenHeight * 0.08,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    //  color: Colors.yellow,
                                    width: screenWidth * 0.7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tr.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              DateFormat('dd MMM')
                                                  .format(tr.date),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              tr.time.format(context),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
}
