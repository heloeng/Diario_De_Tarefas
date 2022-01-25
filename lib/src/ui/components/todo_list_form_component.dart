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
              decoration: InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyles.textFormComponent,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

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
                Text(
                  "Data",
                  style: TextStyles.textFormComponent,
                ),
                Row(
                  children: [
                    TextButton(
                      child: Text(
                        DateFormat('dd - MMMM - yyyy').format(_selectedDate),
                        style: TextStyles.textButtonDateHour,
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Horário",
                  style: TextStyles.textFormComponent,
                ),
                Row(
                  children: [
                    TextButton(
                      child: Text(
                        _time.format(context),
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


  final _avatarList = [
    // CircleAvatar(
    //     child: Icon(
    //       FontAwesomeIcons.shoppingBasket,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.orange),
    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.shoppingBasket),
        backgroundColor: AppColors.orange),

    // CircleAvatar(
    //     child: Icon(
    //       FontAwesomeIcons.basketballBall,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.pink),

    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.basketballBall),
        backgroundColor: AppColors.pink),

    // CircleAvatar(
    //     child: Icon(
    //       Icons.location_on_outlined,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.blue),

    CircleAvatar(
        child: IconWidget(appcolors: Icons.location_on_outlined),
        backgroundColor: AppColors.blue),

    // CircleAvatar(
    //     child: Icon(
    //       FontAwesomeIcons.wineGlass,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.bluelight),

    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.wineGlass),
        backgroundColor: AppColors.bluelight),

    // CircleAvatar(
    //     child: Icon(
    //       Icons.fitness_center_sharp,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.purple),

    CircleAvatar(
        child: IconWidget(appcolors: Icons.fitness_center_sharp),
        backgroundColor: AppColors.purple),

    // CircleAvatar(
    //     child: Icon(
    //       FontAwesomeIcons.bookReader,
    //       color: AppColors.white,
    //       size: 15,
    //     ),
    //     backgroundColor: AppColors.hexachrome_black),

    CircleAvatar(
        child: IconWidget(appcolors: FontAwesomeIcons.bookReader),
        backgroundColor: AppColors.hexachrome_black),
  ];

  int selectIndex = 0;

  listAvatar() {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _avatarList.length,
        itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: selectIndex == index
                    ? [
                        BoxShadow(
                            blurRadius: 0.8,
                            color: AppColors.black,
                            spreadRadius: 2)
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
