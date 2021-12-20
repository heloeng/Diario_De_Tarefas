// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionForm extends StatefulWidget {
  final void Function(String, String, DateTime) onSubmit;

  
  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _iconeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  _submitForm() {
    
    //passo essas informações atraves dos parametros do submit
    final icone = _iconeController.text;
    final title = _titleController.text;

    if (icone.isEmpty || title.isEmpty || _selectedDate == null) {
      return;
    }

    widget.onSubmit(icone, title, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
     
      context: context,
      //mostrar a data inicial: agora
      initialDate: DateTime.now(),
      //data mais antiga agora
      firstDate: DateTime.now(),
      //pode selecionar ate data futura
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
      //espaço dos inputs
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
           
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? "Nenhuma data selecionada"
                        : DateFormat('dd/MM/y').format(_selectedDate),
                  ),
                ),
                TextButton(
                  child: Text('Data'),
                  //chama a função de data
                  onPressed: _showDatePicker,
                ),
              ],
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
