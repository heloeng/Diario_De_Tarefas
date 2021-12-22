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
    context: context,
    //barrierColor: Color(0xFFF5F5F5),
    barrierColor: Color.fromRGBO(211, 211, 211, 0.4),

    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        //    insetPadding: EdgeInsets.all(10),
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        content: options(context, tr),
      );
    },
  );
}

options(BuildContext context, TransactionModel tr) {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.white,
    ),
    height: alturaTela * 0.60,
    width: larguraTela * 0.8,
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.grey[100],
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              tr.icone,
              // SizedBox(
              //   height: alturaTela * 0.05,
              // ),

              SizedBox(height: 30),

              Text(
                tr.title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              // const SizedBox(
              //   // height: alturaTela * 0.05,
              //   height: 5,
              // ),

              SizedBox(height: 10),
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
        Container(
          padding: EdgeInsets.all(30),
          child: Column(
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
                style: TextStyle(
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
