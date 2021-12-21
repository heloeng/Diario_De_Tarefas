import 'package:flutter/material.dart';

class IconsListWidget extends StatelessWidget {
  const IconsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _iconsList = [
      Icons.alarm,
      Icons.ac_unit,
      Icons.accessibility,
      Icons.alarm,
    ];

    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _iconsList.length,
          itemBuilder: (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Icon(_iconsList[index]))),
    );
  }
}
