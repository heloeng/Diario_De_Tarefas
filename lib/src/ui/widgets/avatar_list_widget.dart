import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teste/src/ui/theme/app_colors.dart';

class AvatarListWidget extends StatelessWidget {
  AvatarListWidget({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
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
                  // _selectedIcon = _avatarList[index];

                  // setState(() {
                  //   selectIndex = index;
                  // });
                },
              ),
            )),
      ),
    );
  }
}
