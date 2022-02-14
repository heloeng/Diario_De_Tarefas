import 'package:flutter/cupertino.dart';
import 'package:teste/src/src.dart';



class IconWidget extends StatelessWidget {
  IconData appcolors;
  var backgroundColor;

  IconWidget({required this.appcolors});

  @override
  Widget build(BuildContext context) {
    return Icon(
      appcolors,
      color: AppColors.white,
      size: 15,
    );
  }
}
