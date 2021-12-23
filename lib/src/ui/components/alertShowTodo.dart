import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/data/data.dart';
import 'package:intl/intl.dart';

double alturaTela = 0;
double larguraTela = 0;

alertShowTodo(BuildContext context, TransactionModel tr) {
  alturaTela = MediaQuery.of(context).size.height;
  larguraTela = MediaQuery.of(context).size.width;

  showDialog(
    // useSafeArea: true,
    barrierColor: Colors.white70,
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      // insetPadding: EdgeInsets.all(1),
      backgroundColor: Colors.white,
      // contentPadding: const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
      actionsAlignment: MainAxisAlignment.center,
      // actionsOverflowDirection: VerticalDirection.up,
      // backgroundColor: Colors.transparent,
      contentPadding: const EdgeInsets.fromLTRB(1, 1, 1, 1),

      content: details(context, tr),
      // elevation: 10,
      actions: [
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "OK",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(100, 50)),
              backgroundColor: MaterialStateProperty.all(Color(0xFF00E676)),
            ),
          ),
        ),
      ],
    ),
  );
}

details(BuildContext context, TransactionModel tr) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    height: alturaTela * 0.55,
    width: larguraTela * 0.90,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tr.icone,
              // SizedBox(
              //   height: alturaTela * 0.05,
              // ),

              const SizedBox(height: 30),

              Text(
                tr.title,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              // const SizedBox(
              //   // height: alturaTela * 0.05,
              //   height: 5,
              // ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('dd MMM').format(tr.date),
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    // height: alturaTela * 0.05,
                    width: 15,
                  ),
                  Text(
                    '${tr.time.format(context)}',
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: const BoxDecoration(
              // color: Colors.red,
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Descrição',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                tr.descricao,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              // SizedBox(
              //   height: alturaTela * 0.05,
              // ),
            ],
          ),
        ),
      ],
    ),
  );
}
