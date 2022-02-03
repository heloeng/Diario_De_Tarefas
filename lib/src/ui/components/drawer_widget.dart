import 'package:flutter/material.dart';
import 'package:teste/src/ui/components/drawer_todo_list_form.dart';
import 'package:teste/src/ui/theme/text_style_widget.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 160, top: 80),
              child: Text("Nova Tarefa", style: TextStyles.titleHomeAppBar),
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
