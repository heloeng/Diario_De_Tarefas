import 'package:flutter/material.dart';
import 'package:teste/src/ui/widgets/icons_list_widget.dart';
import 'package:intl/intl.dart';

class TransactionFormComponent extends StatefulWidget {
  final void Function(String, String, String, DateTime, TimeOfDay) onSubmit;

  const TransactionFormComponent(this.onSubmit, {Key? key}) : super(key: key);

  @override
  _TransactionFormComponent createState() => _TransactionFormComponent();
}

class _TransactionFormComponent extends State<TransactionFormComponent> {
  final _titleController = TextEditingController();
  final _iconeController = TextEditingController();
  final _descricaoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  _submitForm() {
    final icone = _iconeController.text;
    final title = _titleController.text;
    final descricao = _descricaoController.text;

    if (icone.isEmpty == null ||
        title.isEmpty == null ||
        descricao.isEmpty == null ||
        _selectedDate == null ||
        _time == null) {
      return;
    }

    widget.onSubmit(icone, title, descricao, _selectedDate, _time);
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

  late TimeOfDay picker;

  // ignore: prefer_void_to_null
  Future<Null> selectTime(BuildContext context) async {
    picker = (await showTimePicker(
      context: context,
      initialTime: _time,
    ))!;
    setState(() {
      _time = picker;
    });
  }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             const IconsListWidget(),
//             TextField(
//               controller: _iconeController,
//               onSubmitted: (_) => _submitForm(),
//               decoration: const InputDecoration(
//                 labelText: 'Icone',
//               ),
//             ),
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Título',
//               ),
//             ),
//             TextField(
//               controller: _descricaoController,
//               decoration: const InputDecoration(
//                 labelText: 'Descrição',
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text(
//                   "Data",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     const Text("Selecione a data:"),
//                     TextButton(
//                       child: Text(
//                         _selectedDate == null
//                             ? "Nenhuma data selecionada"
//                             : _selectedDate.toString(),
//                       ),
//                       onPressed: _showDatePicker,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 const Text(
//                   "Hora",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     const Text("Selecione a hora:"),
//                     TextButton(
//                       child: const Text('hora aqui'),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: const Text('Adicionar'),
//                   style: ButtonStyle(
//                     minimumSize: MaterialStateProperty.all(const Size(150, 60)),
//                     backgroundColor: MaterialStateProperty.resolveWith(
//                       (states) {
//                         if (states.contains(MaterialState.pressed)) {
//                           return Colors.amber[900];
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const IconsListWidget(),
            TextField(
              controller: _iconeController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: 'Icone',
              ),
            ),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: _descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Data",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text(
                          // ignore: unnecessary_null_comparison
                          // _selectedDate == null
                          //     ? "Nenhuma data selecionada"
                          //     : DateFormat('dd - MMMM- yyyy')
                          //         .format(_selectedDate),

                          "Selecione a data"),
                      //chama a função de data
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Hora:",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    // Text("Selecione a hora:"),
                    TextButton(
                      child: const Text('Selecione a hora'),
                      onPressed: () {
                        selectTime(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Adicionar'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(150, 60)),
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
