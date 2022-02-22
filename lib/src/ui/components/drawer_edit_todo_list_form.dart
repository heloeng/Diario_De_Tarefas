import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';

class DrawerEditTodoListForm extends StatefulWidget {
  const DrawerEditTodoListForm({Key? key}) : super(key: key);

  @override
  _DrawerEditTodoListForm createState() => _DrawerEditTodoListForm();
}

class _DrawerEditTodoListForm extends State<DrawerEditTodoListForm> {
  final tasksList = <ToDoListModel>[];
  final globalKey = GlobalKey<ScaffoldState>();
  late final talkController = Provider.of<TalkController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ícone",
            style: TextStyles.textFormComponent,
            // AppCollors.grey,
            textAlign: TextAlign.right,
          ),
          const SizedBox(
            height: 15,
          ),
          const ListAvatarIcone(),
          TextField(
            controller: talkController.titleController,
            decoration: InputDecoration(
              labelText: 'Título',
              labelStyle: TextStyles.textFormComponent,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Descrição",
            style: TextStyles.textFormComponent,
            // AppCollors.grey,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 7,
          ),
          TextField(
            controller: talkController.descricaoController,
            maxLines: 5,
            textAlign: TextAlign.justify,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data",
                style: TextStyles.textFormComponent,
              ),
              Row(
                children: [
                  TextButton(
                      child: Text(
                        DateFormat('dd - MMMM - yyyy')
                            .format(talkController.dateSelect),
                        style: TextStyles.textButtonDateHour,
                      ),
                      onPressed: () {
                        selectData(context: context);
                      }),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Horário",
                style: TextStyles.textFormComponent,
              ),
              Row(
                children: [
                  TextButton(
                    child: Text(
                      talkController.time.format(context),
                      style: TextStyles.textButtonDateHour,
                    ),
                    onPressed: () {
                      selectTime(context);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    ));
  }
}
