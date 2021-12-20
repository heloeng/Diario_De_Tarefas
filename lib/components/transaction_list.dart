// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teste/model/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Insira sua primeira tarefa!!",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
               

                final tr = transactions[index];

                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Text(tr.icone),
                    ),

                    title: Text(
                      tr.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    trailing: Text(
                     
                      DateFormat('dd MMM yyyy').format(tr.date),

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                                       //////////////////////FALTA A HORA///////////////////////
                  ),
                );
              },
            ),
    );
  }
}
