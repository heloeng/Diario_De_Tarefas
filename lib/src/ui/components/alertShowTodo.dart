import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/data/data.dart';

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
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        topLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
      ),
    ),
    height: alturaTela * 0.60,
    width: larguraTela * 0.8,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        tr.icone,
        SizedBox(
          height: alturaTela * 0.05,
        ),
        Text(
          tr.title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(
          height: alturaTela * 0.05,
        ),
        SizedBox(
          height: alturaTela * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: SizedBox(
            width: larguraTela * 0.8,
            child: Row(
              children: [
                Text('Oi'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: alturaTela * 0.03,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: larguraTela * 0.05, right: larguraTela * 0.05),
          child: Row(
            children: [
              Text('Oi'),
            ],
          ),
        ),
      ],
    ),
  );
}
