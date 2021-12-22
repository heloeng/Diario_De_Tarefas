
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// class IconsListWidget extends StatelessWidget {
//   const IconsListWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var _iconsList = [
//       FontAwesomeIcons.shoppingBasket,
//       FontAwesomeIcons.basketballBall,
//       FontAwesomeIcons.wineGlass,
//       Icons.location_on_outlined,
//       Icons.fitness_center_sharp,
//       FontAwesomeIcons.mapMarkerAlt,
//       FontAwesomeIcons.dumbbell,
//       Icons.alarm,
//     ];

//     return SizedBox(
//       height: 70,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: _iconsList.length,
//           itemBuilder: (_, index) => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 13),
//               child: GestureDetector(
//                 child: Icon(_iconsList[index]),
//                 onTap: () {
//                   print('CLICOU NO ICONE: $index');
//                 },
//               ))),
//     );
//   }