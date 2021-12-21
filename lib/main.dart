// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import '/components/transaction_form.dart';
import 'package:teste/components/transaction_list.dart';
import 'package:teste/model/transaction.dart';

main() => runApp(ExpenseApp());

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  _addTransaction(String icone, String title, String descricao, DateTime date) {
    final newTransaction = Transaction(
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

    //fechar o modal

    Navigator.of(context).pop();
  }

  //função para abrir o modal
  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Tarefas'), actions: [
        // IconButton(
        //   icon: FaIcon(FontAwesomeIcons.gamepad),
        //   onPressed: () => _opentransactionFormModal(context),
        // ),
      ]),
      endDrawer: Drawer(
        child: Column(children: [
          _TransactionFormState 

        ],),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _opentransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
