import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final globalKey = GlobalKey<ScaffoldState>();

class _MyHomePageState extends State<MyHomePage> {
  late final UserController userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  late final talkController = Provider.of<TalkController>(
    context,
    listen: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: globalKey,
      appBar: AppBar(
        backgroundColor: AppColors.whiteSmoke,
        centerTitle: true,
        title: Text('Tarefas', style: TextStyles.titleHomeAppBar),
        actions: [
          IconButton(
            alignment: Alignment.bottomLeft,
            onPressed: () async {
              await userController.logout();
            },
            icon: const Icon(
              Icons.exit_to_app_outlined,
            ),
          )
        ],
      ),
      endDrawer: const DrawerWidget(),
      body: SizedBox(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  ToDoListComponent(talkController.tasksList),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          talkController.selectedModel = null;
          globalKey.currentState!.openEndDrawer();
        },
        backgroundColor: AppColors.greenAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
