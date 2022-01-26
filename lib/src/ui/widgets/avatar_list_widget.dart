// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:teste/src/ui/theme/app_colors.dart';

// import 'icon.widget.dart';

// class AvatarListWidget extends StatelessWidget {
//   AvatarListWidget({Key? key}) : super(key: key); 

  
//   final _avatarList = [
//     // CircleAvatar(
//     //     child: Icon(
//     //       FontAwesomeIcons.shoppingBasket,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.orange),
//     CircleAvatar(
//         child: IconWidget(appcolors: FontAwesomeIcons.shoppingBasket),
//         backgroundColor: AppColors.orange),

//     // CircleAvatar(
//     //     child: Icon(
//     //       FontAwesomeIcons.basketballBall,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.pink),

//     CircleAvatar(
//         child: IconWidget(appcolors: FontAwesomeIcons.basketballBall),
//         backgroundColor: AppColors.pink),

//     // CircleAvatar(
//     //     child: Icon(
//     //       Icons.location_on_outlined,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.blue),

//     CircleAvatar(
//         child: IconWidget(appcolors: Icons.location_on_outlined),
//         backgroundColor: AppColors.blue),

//     // CircleAvatar(
//     //     child: Icon(
//     //       FontAwesomeIcons.wineGlass,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.bluelight),

//     CircleAvatar(
//         child: IconWidget(appcolors: FontAwesomeIcons.wineGlass),
//         backgroundColor: AppColors.bluelight),

//     // CircleAvatar(
//     //     child: Icon(
//     //       Icons.fitness_center_sharp,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.purple),

//     CircleAvatar(
//         child: IconWidget(appcolors: Icons.fitness_center_sharp),
//         backgroundColor: AppColors.purple),

//     // CircleAvatar(
//     //     child: Icon(
//     //       FontAwesomeIcons.bookReader,
//     //       color: AppColors.white,
//     //       size: 15,
//     //     ),
//     //     backgroundColor: AppColors.hexachrome_black),

//     CircleAvatar(
//         child: IconWidget(appcolors: FontAwesomeIcons.bookReader),
//         backgroundColor: AppColors.hexachrome_black),
//   ];

//   int selectIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: _avatarList.length,
//         itemBuilder: (_, index) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5),
//             child: Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: selectIndex == index
//                     ? [
//                         BoxShadow(
//                             blurRadius: 0.8,
//                             color: AppColors.black,
//                             spreadRadius: 2)
//                       ]
//                     : null,
//               ),
//               child: GestureDetector(
//                 child: (_avatarList[index]),
//                 onTap: () {
//                   // _selectedIcon = _avatarList[index];

//                   // setState(() {
//                   //   selectIndex = index;
//                   // });
//                 },
//               ),
//             )),
//       ),
//     );
//   }
// }
