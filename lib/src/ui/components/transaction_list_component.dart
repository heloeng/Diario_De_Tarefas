import 'package:flutter/material.dart';
import 'package:teste/src/src.dart';

import 'package:intl/intl.dart';
import 'package:teste/src/ui/components/alertShowTodo.dart';

class TransactionListComponent extends StatelessWidget {
  final List<TransactionModel> transactions;

  TransactionListComponent(this.transactions, {Key? key}) : super(key: key);

  get time => null;

  double alturaTela = 0;
  double larguraTela = 0;

  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    return SizedBox(
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
          : SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = transactions[index];

                  return GestureDetector(
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 10,
                      ),
                      child:

              
                          Container(
                        //  color: Colors.red,
                        width: larguraTela * 0.95,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              child: tr.icone,
                            ),
                            SizedBox(
                              height: alturaTela * 0.08,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    //  color: Colors.yellow,
                                    width: larguraTela * 0.80,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tr.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          DateFormat('dd MMM').format(tr.date),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: larguraTela * 0.80,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${tr.time.format(context)}',
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () => alertShowTodo(context, tr),
                  );
                },
              ),
            ),
    );
  }
}
