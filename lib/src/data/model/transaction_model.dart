import 'package:flutter/material.dart';

class TransactionModel {
  final String id;
  final String icone;
  final String title;
  final String descricao;
  final DateTime date;
  final TimeOfDay time;

  TransactionModel({
    required this.id,
    required this.icone,
    required this.title,
    required this.descricao,
    required this.date,
    required this.time,
  });
}
