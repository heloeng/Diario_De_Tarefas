import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/src/src.dart';

//14
class SplashLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.today),
            ],
          ),
          Text("Agendar Tarefas"),
          //animação de carregamento
          LinearProgressIndicator(),
        ],
      ),
    );
  }
}
