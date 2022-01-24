import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:teste/src/ui/theme/app_colors.dart';
import '../../src.dart';

class ToDoListFormComponent extends StatefulWidget {
  final void Function(CircleAvatar, String, String, DateTime, TimeOfDay)
      onSubmit;

  const ToDoListFormComponent(this.onSubmit, {Key? key}) : super(key: key);

  @override
  _ToDoListFormComponent createState() => _ToDoListFormComponent();
}

class _ToDoListFormComponent extends State<ToDoListFormComponent> {
  final _titleController = TextEditingController();
  // final _iconeController = TextEditingController();
  final _descricaoController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  CircleAvatar _selectedIcon = const CircleAvatar();

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

  Future<void> selectTime(BuildContext context) async {
    var picker = (await showTimePicker(
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
            // Text(
            //   'Ícone',
            //   style: GoogleFonts.openSans(
            //     fontSize: 10,
            //     fontWeight: FontWeight.w800,
            //     color: Colors.grey,
            //   ),
            //   textAlign: TextAlign.right,
            // ),

            Text(
              "Ícone",
              style: TextStyles.textFormComponent,
              // AppCollors.grey,
              textAlign: TextAlign.right,
            ),

            const SizedBox(
              height: 15,
            ),

            AvatarListWidget(),
            // listAvatar(),
            TextField(
              controller: _titleController,
              // decoration: InputDecoration(
              //   labelText: 'Título',
              //   labelStyle: GoogleFonts.openSans(
              //     fontSize: 10,
              //     fontWeight: FontWeight.w800,
              //     color: Colors.grey,
              //   ),
              // ),
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyles.textFormComponent,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            // Text(
            //   'Descrição',
            //   style: GoogleFonts.openSans(
            //     fontSize: 10,
            //     fontWeight: FontWeight.w800,
            //     color: Colors.grey,
            //   ),
            //   textAlign: TextAlign.left,
            // ),

            Text(
              "Descrição",
              style: TextStyles.textFormComponent,
              // AppCollors.grey,
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
                // Text(
                //   "Data",
                //   style: GoogleFonts.openSans(
                //     fontSize: 10,
                //     fontWeight: FontWeight.w800,
                //     color: Colors.grey,
                //   ),
                // ),

                Text(
                  "Data",
                  style: TextStyles.textFormComponent,
                ),

                Row(
                  children: [
                    TextButton(
                      child: Text(
                        DateFormat('dd - MMMM - yyyy').format(_selectedDate),
                        // style: GoogleFonts.openSans(
                        //   fontSize: 10,
                        //   color: Colors.black,
                        // ),
                        style: TextStyles.textButtonDateHour,
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // Text(
                //   " Horário:",
                //   style: GoogleFonts.openSans(
                //     fontSize: 10,
                //     fontWeight: FontWeight.w800,
                //     color: Colors.grey,
                //   ),
                // ),
                Text(
                  "Horário",
                  style: TextStyles.textFormComponent,
                ),

                Row(
                  children: [
                    TextButton(
                      child: Text(
                        _time.format(context),
                        // style: GoogleFonts.openSans(
                        //   fontSize: 10,
                        //   color: Colors.black,
                        // ),
                        style: TextStyles.textButtonDateHour,
                      ),
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
                ButonnWidget(text: 'Adicionar', onpressed: _submitForm),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
