import 'dart:math';

import 'package:flutter/material.dart';

import '../../src.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<TransactionModel> _transactions = [];

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
          centerTitle: true, title: const Text('Tarefas'), actions: const []),
      endDrawer: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 51.0),
              child: TransactionFormComponent(_addTransaction),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionListComponent(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => globalKey.currentState!.openEndDrawer(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _addTransaction(String icone, String title, String descricao, DateTime date) {
    final newTransaction = TransactionModel(
      id: Random().nextDouble().toString(),
      icone: icone,
      title: title,
      descricao: descricao,
      date: date,
    );

    setState(
      () {
        _transactions.add(newTransaction);
      },
    );
  }
}
