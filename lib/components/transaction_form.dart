// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, String, String, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _iconeController = TextEditingController();
  final _descricaoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final icone = _iconeController.text;
    final title = _titleController.text;
    final descricao = _descricaoController.text;

    if (icone.isEmpty ||
        title.isEmpty ||
        descricao.isEmpty ||
        _selectedDate == null) {
      return;
    }

    widget.onSubmit(icone, title, descricao, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }

        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _iconeController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Icone',
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Data",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text("Selecione a data:"),
                    TextButton(
                      child: Text(
                        _selectedDate == null
                            ? "Nenhuma data selecionada"
                            : DateFormat('dd/MM/yyyy').format(_selectedDate),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Hora",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text("Selecione a hora:"),
                    TextButton(
                      child: Text('hora aqui'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Adicionar'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 60)),
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.amber[900];
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
