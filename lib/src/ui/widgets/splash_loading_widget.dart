import 'package:flutter/material.dart';

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
