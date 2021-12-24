// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/ui/widgets/avatar_list_widget.dart';
import 'package:teste/src/ui/widgets/icons_list_widget.dart';
import 'package:intl/intl.dart';

class TransactionFormComponent extends StatefulWidget {
  final void Function(CircleAvatar, String, String, DateTime, TimeOfDay)
      onSubmit;

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

  CircleAvatar _selectedIcon = CircleAvatar();

  _submitForm() {
    CircleAvatar icone = _selectedIcon;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ícone',
              textAlign: TextAlign.right,
            ),
            // listaIcones(),
            // AvatarListWidget(),
            listAvatar(),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Título',
              ),
            ),

            const SizedBox(
              height: 23,
            ),
            Text(
              'Descrição',
              textAlign: TextAlign.left,
            ),

            const SizedBox(
              height: 7,
            ),

            TextField(
              controller: _descricaoController,
              maxLines: 5,
              textAlign: TextAlign.justify,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF00E676)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  final _avatarList = [
    const CircleAvatar(
        child: Icon(FontAwesomeIcons.shoppingBasket, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFFFFA000)),
    const CircleAvatar(
        child: Icon(FontAwesomeIcons.basketballBall, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFFFF4081)),
    const CircleAvatar(
        child: Icon(Icons.location_on_outlined, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF1976D2)),
    const CircleAvatar(
        child: Icon(FontAwesomeIcons.wineGlass, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF80D8FF)),
    const CircleAvatar(
        child: Icon(Icons.fitness_center_sharp, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFFAA00FF)),
    const CircleAvatar(
        child: Icon(FontAwesomeIcons.bookReader, color: Color(0xFFFFFFFF)),
        backgroundColor: Color(0xFF212121)),
  ];

  int selectIndex = 0;

  listAvatar() {
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _avatarList.length,
        itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: GestureDetector(
              child: (_avatarList[index]),
              onTap: () {
                _selectedIcon = _avatarList[index];
                selectIndex = index;
              },
            )),
      ),
    );
  }
}
