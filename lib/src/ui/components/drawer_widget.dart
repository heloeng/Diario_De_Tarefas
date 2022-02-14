import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';


class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late final talkController = Provider.of<TalkController>(context, listen: true);

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: (talkController.selectedModel != null) ? Text("Tarefa ${talkController.selectedModel!.title}", style: TextStyles.titleHomeAppBar) : Text("Nova Tarefa", style: TextStyles.titleHomeAppBar),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  top: 9.0,
                ),
                child: DrawerTodoListForm())
          ],
        ),
      ),
    );
  }
}
