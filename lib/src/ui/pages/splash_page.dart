import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/src/src.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, userController, child) {
        switch (userController.authState) {
          case AuthState.signed:
            late final talkController =
                Provider.of<TalkController>(context, listen: false);
            talkController.loadTaks(userController.model);
            return MyHomePage();

          case AuthState.unsigned:
            return LoginPage();

          case AuthState.loading:
            return SplashLoadingWidget();
        }
      },
    );
  }
}
