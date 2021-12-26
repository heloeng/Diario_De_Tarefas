import 'package:flutter/material.dart';
import 'package:teste/src/src.dart';

import 'package:intl/intl.dart';
import 'package:teste/src/ui/components/alertShowTodo.dart';

class TransactionListComponent extends StatefulWidget {
  final List<TransactionModel> transactions;

  const TransactionListComponent(this.transactions, {Key? key})
      : super(key: key);

  @override
  State<TransactionListComponent> createState() =>
      _TransactionListComponentState();
}

class _TransactionListComponentState extends State<TransactionListComponent> {
  get time => null;

  double alturaTela = 0;

  double larguraTela = 0;

  @override
  Widget build(BuildContext context) {
    alturaTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 520,
      child: widget.transactions.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                itemCount: widget.transactions.length,
                itemBuilder: (ctx, index) {
                  final tr = widget.transactions[index];

                  return GestureDetector(
                    child: Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      child: Container(
                        //  color: Colors.red,
                        width: larguraTela * 0.95,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 23,
                              child: tr.icone,
                            ),
                            SizedBox(
                              height: alturaTela * 0.08,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    //  color: Colors.yellow,
                                    width: larguraTela * 0.7,
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
                                        Column(
                                          children: [
                                            Text(
                                              DateFormat('dd MMM')
                                                  .format(tr.date),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              tr.time.format(context),
                                            ),
                                          ],
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
