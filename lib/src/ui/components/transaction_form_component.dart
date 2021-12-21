// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/ui/widgets/icons_list_widget.dart';
import 'package:intl/intl.dart';

class TransactionFormComponent extends StatefulWidget {
  final void Function(Icon, String, String, DateTime, TimeOfDay) onSubmit;

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
  // Icon _selectedIcon = Icon(FontAwesomeIcons.shoppingBasket);
  Icon _selectedIcon = Icon(FontAwesomeIcons.shoppingBasket);

  _submitForm() {
    Icon icone = _selectedIcon;
    final title = _titleController.text;
    final descricao = _descricaoController.text;

    if (title.isEmpty == null ||
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

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // listaIcones(),
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
                      child: Text(
                        _selectedDate == null
                            ? "Selecione a data"
                            : DateFormat('dd - MMMM - yyyy')
                                .format(_selectedDate),
                      ),
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
                  child: const Text('Adicionar',style: TextStyle(color: Colors.white),),
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

  // final _iconsList = [
  //   Icon(FontAwesomeIcons.shoppingBasket, color: Colors.grey),
  //   Icon(FontAwesomeIcons.basketballBall, color: Colors.grey),
  //   Icon(FontAwesomeIcons.wineGlass, color: Colors.grey),
  //   Icon(Icons.location_on_outlined, color: Colors.grey),
  //   Icon(Icons.fitness_center_sharp, color: Colors.grey),
  //   Icon(FontAwesomeIcons.mapMarkerAlt, color: Colors.grey),
  //   Icon(FontAwesomeIcons.dumbbell, color: Colors.grey),
  //   Icon(Icons.alarm, color: Colors.grey),
  // ];

  // int selectIndex = 0;

  // listaIcones() {
  //   return SizedBox(
  //     height: 70,
  //     width: MediaQuery.of(context).size.width,
  //     child: ListView.builder(
  //         scrollDirection: Axis.horizontal,
  //         itemCount: _iconsList.length,
  //         itemBuilder: (_, index) => Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 13),
  //             child: GestureDetector(
  //               child: _iconsList[index],
  //               onTap: () {
  //                 _selectedIcon = _iconsList[index];
  //                 unselectIcon();
  //                 setState(() {
  //                   _iconsList[index] = Icon(
  //                     _iconsList[index].icon,
  //                     color: Colors.green,
  //                   );
  //                 });
  //                 selectIndex = index;
  //               },
  //             ))),
  //   );
  // }

  // unselectIcon() {
  //   setState(() {
  //     _iconsList[selectIndex] = Icon(
  //       _iconsList[selectIndex].icon,
  //       color: Colors.grey,
  //     );
  //   });
  // }
}
