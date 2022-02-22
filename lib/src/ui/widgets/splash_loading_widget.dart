import 'package:flutter/material.dart';

class SplashLoadingWidget extends StatelessWidget {
  const SplashLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:const  [
              Icon(Icons.today),
            ],
          ),
          const Text("Agendar Tarefas"),
          //animação de carregamento
          const LinearProgressIndicator(),
        ],
      ),
    );
  }
}
