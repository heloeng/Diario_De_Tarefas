// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:teste/controllers/talk_controller.dart';

// import 'package:teste/controllers/user_controller.dart';
// import 'package:teste/src/ui/theme/app_colors.dart';
// import '../../src.dart';

// class ToDoListFormComponent extends StatelessWidget {
  

 
//   // final _titleController = TextEditingController();
//   // // final _iconeController = TextEditingController();
//   // final _descricaoController = TextEditingController();
//   // // DateTime _selectedDate = DateTime.now();
//   // DateTime dateSelect = DateTime.now();
//   // TimeOfDay _time = TimeOfDay.now();

//   // CircleAvatar _selectedIcon = const CircleAvatar();

//   // _submitForm() {
//   //   CircleAvatar icone = _selectedIcon;
//   //   final title = _titleController.text;
//   //   final descricao = _descricaoController.text;

//   //   if (title.isEmpty == null ||
//   //       descricao.isEmpty == null ||
//   //       dateSelect == null ||
//   //       _time == null) {
//   //     return;
//   //   }

//   //   widget.onSubmit(icone, title, descricao, dateSelect, _time);
//   // }

//   // late final talkController = Provider.of<TalkController>(
//   //   context,
//   //   listen: false,
//   // );
//   // _showDatePicker() {
//   //   showDatePicker(
//   //     context: context,
//   //     initialDate: DateTime.now(),
//   //     firstDate: DateTime.now(),
//   //     lastDate: DateTime(2025),
//   //   ).then(
//   //     (pickedDate) {
//   //       if (pickedDate == null) {
//   //         return;
//   //       }

//   //       setState(() {
//   //         _selectedDate = pickedDate;
//   //       });
//   //     },
//   //   );
//   // }

// //  talkController.selectData();

//   // selectData(context)

//   // Future<void> selectTime(BuildContext context) async {
//   //   var picker = (await showTimePicker(
//   //     context: context,
//   //     initialTime: _time,
//   //   ))!;

//   //   setState(() {
//   //     _time = picker;
//   //   });
//   // }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Card(
//   //       child: Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Text(
//   //           "Ícone",
//   //           style: TextStyles.textFormComponent,
//   //           // AppCollors.grey,
//   //           textAlign: TextAlign.right,
//   //         ),
//   //         const SizedBox(
//   //           height: 15,
//   //         ),
//   //         listAvatar(),
//   //         TextField(
//   //           controller: talkController.titleController,
//   //           decoration: InputDecoration(
//   //             labelText: 'Título',
//   //             labelStyle: TextStyles.textFormComponent,
//   //           ),
//   //         ),
//   //         const SizedBox(
//   //           height: 25,
//   //         ),
//   //         Text(
//   //           "Descrição",
//   //           style: TextStyles.textFormComponent,
//   //           // AppCollors.grey,
//   //           textAlign: TextAlign.left,
//   //         ),
//   //         const SizedBox(
//   //           height: 7,
//   //         ),
//   //         TextField(
//   //           controller: talkController.descricaoController,
//   //           maxLines: 5,
//   //           textAlign: TextAlign.justify,
//   //           decoration: const InputDecoration(
//   //             border: OutlineInputBorder(),
//   //           ),
//   //         ),
//   //         const SizedBox(
//   //           height: 8,
//   //         ),
//   //         Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Text(
//   //               "Data",
//   //               style: TextStyles.textFormComponent,
//   //             ),
//   //             Row(
//   //               children: [
//   //                 TextButton(
//   //                     child: Text(
//   //                       DateFormat('dd - MMMM - yyyy')
//   //                           .format(talkController.dateSelect),
//   //                       style: TextStyles.textButtonDateHour,
//   //                     ),
//   //                     onPressed: () {
//   //                       selectDate:
//   //                       (context);
//   //                     }),
//   //               ],
//   //             ),
//   //             const SizedBox(
//   //               height: 15,
//   //             ),
//   //             Text(
//   //               "Horário",
//   //               style: TextStyles.textFormComponent,
//   //             ),
//   //             Row(
//   //               children: [
//   //                 TextButton(
//   //                   child: Text(
//   //                     talkController.time.format(context),
//   //                     style: TextStyles.textButtonDateHour,
//   //                   ),
//   //                   onPressed: () {
//   //                     selectTime(context);
//   //                   },
//   //                 ),
//   //               ],
//   //             ),
//   //           ],
//   //         ),
//   //         const SizedBox(
//   //           height: 40,
//   //         ),
//   //         Row(
//   //           mainAxisAlignment: MainAxisAlignment.end,
//   //           children: [
//   //             // ButonnWidget(text: 'Adicionar', onpressed: _submitForm),
//   //             ButonnWidget(text: 'Adicionar', onpressed: () => talkController.adicionarTarefa()),
//   //           ],
//   //         ),
//   //       ],
//   //     ),
//   //   ));
//   // }

//   // final _avatarList = [
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: FontAwesomeIcons.shoppingBasket),
//   //       backgroundColor: AppColors.orange),
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: FontAwesomeIcons.basketballBall),
//   //       backgroundColor: AppColors.pink),
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: Icons.location_on_outlined),
//   //       backgroundColor: AppColors.blue),
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: FontAwesomeIcons.wineGlass),
//   //       backgroundColor: AppColors.bluelight),
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: Icons.fitness_center_sharp),
//   //       backgroundColor: AppColors.purple),
//   //   CircleAvatar(
//   //       child: IconWidget(appcolors: FontAwesomeIcons.bookReader),
//   //       backgroundColor: AppColors.hexachrome_black),
//   // ];

//   // int selectIndex = 0;

//   // listAvatar() {
//   //   return SizedBox(
//   //     height: 50,
//   //     width: MediaQuery.of(context).size.width,
//   //     child: ListView.builder(
//   //       scrollDirection: Axis.horizontal,
//   //       itemCount: talkController.avatarList.length,
//   //       itemBuilder: (_, index) => Padding(
//   //           padding: const EdgeInsets.symmetric(horizontal: 5),
//   //           child: Container(
//   //             decoration: BoxDecoration(
//   //               shape: BoxShape.circle,
//   //               boxShadow: talkController.selectIndex == index
//   //                   ? [
//   //                       BoxShadow(
//   //                           blurRadius: 0.8,
//   //                           color: AppColors.black,
//   //                           spreadRadius: 2)
//   //                     ]
//   //                   : null,
//   //             ),
//   //             child: GestureDetector(
//   //               child: (talkController.avatarList[index]),
//   //               onTap: () {
//   //                 talkController.selecionarIcone(index);

                 
//   //               },
//   //             ),
//   //           )),
//   //     ),
//   //   );
//   // }
// }
