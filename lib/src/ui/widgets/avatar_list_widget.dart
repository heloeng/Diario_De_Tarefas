import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvatarListWidget extends StatelessWidget {
  const AvatarListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//     var _avatarList = [
//       const CircleAvatar(
//           child:
//               Icon(FontAwesomeIcons.shoppingBasket, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFFFFA000)),
//       const CircleAvatar(
//           child:
//               Icon(FontAwesomeIcons.basketballBall, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFFFF4081)),
//       const CircleAvatar(
//           child: Icon(Icons.location_on_outlined, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFF1976D2)),
//       const CircleAvatar(
//           child: Icon(FontAwesomeIcons.wineGlass, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFF80D8FF)),
//       const CircleAvatar(
//           child: Icon(Icons.fitness_center_sharp, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFFAA00FF)),
//       const CircleAvatar(
//           child: Icon(FontAwesomeIcons.bookReader, color: Color(0xFFFFFFFF)),
//           backgroundColor: Color(0xFF212121)),
//     ];

//     return SizedBox(
//       height: 70,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: _avatarList.length,
//         itemBuilder: (_, index) => Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 13),
//           child: GestureDetector(
//             child: (_avatarList[index]),
//           ),
//         ),
//       ),
//     );
//   }
// }

    var _avatarList = [
      const CircleAvatar(
          child:
              Icon(FontAwesomeIcons.shoppingBasket, color: Color(0xFFFFFFFF)),
          backgroundColor: Color(0xFFFFA000)),
      const CircleAvatar(
          child:
              Icon(FontAwesomeIcons.basketballBall, color: Color(0xFFFFFFFF)),
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
                selectIndex = index;
              },
            )),
      ),
    );
  }
}
