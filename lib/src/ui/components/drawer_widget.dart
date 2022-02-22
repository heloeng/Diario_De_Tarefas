import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final talkController =
        Provider.of<TalkController>(context, listen: true);
    late final UserController userController = Provider.of<UserController>(
      context,
      listen: false,
    );

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userController.model.nome),
              accountEmail: Text(userController.user!.email!),
            ),
            Container(
              margin: const EdgeInsets.only(top: 80),
              child: (talkController.selectedModel != null)
                  ? Text("Tarefa: ${talkController.selectedModel!.title}",
                      style: TextStyles.titleHomeAppBar)
                  : Text("Nova Tarefa", style: TextStyles.titleHomeAppBar),
            ),
            const Padding(
                padding: EdgeInsets.only(
                  top: 9.0,
                ),
                child: DrawerTodoListForm())
          ],
        ),
      ),
    );
  }
}
