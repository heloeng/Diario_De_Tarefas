// classe que representa os dados da transação do objeto
import 'package:flutter/material.dart';

class Transaction {
  //atributos do construtor da classe
  final String id;
  final String icone;
  final String title;
  final String descricao;
  final DateTime date;

  
  Transaction({
    required this.id,
    required this.icone,
    required this.title,
    required this.descricao,
    required this.date,
//falta a descrição
//falta a hora
  });
}
