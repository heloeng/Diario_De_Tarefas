import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
            Text(
              'Ícone',
              style: GoogleFonts.openSans(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),

            // AvatarListWidget(),
            listAvatar(),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: GoogleFonts.openSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(
              height: 23,
            ),
            Text(
              'Descrição',
              style: GoogleFonts.openSans(
                fontSize: 10,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
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
                Text(
                  "Data",
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      child: Text(
                        DateFormat('dd - MMMM - yyyy').format(_selectedDate),
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  " Horário:",
                  style: GoogleFonts.openSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      child: Text(
                        _time.format(context),
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: Colors.black,
                        ),
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
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    'Adicionar',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(105, 40)),
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF00E676)),
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
        child: Icon(
          FontAwesomeIcons.shoppingBasket,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFFFFA000)),
    const CircleAvatar(
        child: Icon(
          FontAwesomeIcons.basketballBall,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFFFF4081)),
    const CircleAvatar(
        child: Icon(
          Icons.location_on_outlined,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFF1976D2)),
    const CircleAvatar(
        child: Icon(
          FontAwesomeIcons.wineGlass,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFF80D8FF)),
    const CircleAvatar(
        child: Icon(
          Icons.fitness_center_sharp,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFFAA00FF)),
    const CircleAvatar(
        child: Icon(
          FontAwesomeIcons.bookReader,
          color: Color(0xFFFFFFFF),
          size: 15,
        ),
        backgroundColor: Color(0xFF212121)),
  ];

  int selectIndex = 0;

  listAvatar() {
    return SizedBox(
      height: 30,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _avatarList.length,
        itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: selectIndex == index
                    ? [
                        const BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            spreadRadius: 5)
                      ]
                    : null,
              ),
              child: GestureDetector(
                child: (_avatarList[index]),
                onTap: () {
                  _selectedIcon = _avatarList[index];

                  setState(() {
                    selectIndex = index;
                  });
                },
              ),
            )),
      ),
    );
  }
}
