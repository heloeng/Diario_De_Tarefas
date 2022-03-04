import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class ToDoListModel {
  String id;
  String icone;
  String title;
  String descricao;
  DateTime date;
  TimeOfDay time;
  String user;
  Uint8List? imagem;

  ToDoListModel({
    required this.id,
    required this.icone,
    required this.title,
    required this.descricao,
    required this.date,
    required this.time,
    required this.user,
    this.imagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'icone': icone.toString(),
      'title': title,
      'user': user,
      'descricao': descricao,
      'date': date.millisecondsSinceEpoch,
      'time': time.toString(),
      'imagem': imagem != null ? Blob(imagem!) : null,
    };
  }

  factory ToDoListModel.fromMap(Map<String, dynamic> map) {
    return ToDoListModel(
      id: map['id'] ?? '',
      user: map['user'] ?? '',
      icone: map['icone'],
      title: map['title'] ?? '',
      descricao: map['descricao'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      time: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
      imagem: map['imagem']?.bytes,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoListModel.fromJson(String source) => ToDoListModel.fromMap(json.decode(source));
}
