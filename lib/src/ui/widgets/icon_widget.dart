import 'package:flutter/cupertino.dart';
import 'package:teste/src/src.dart';



class IconWidget extends StatelessWidget {
  IconData appcolors;
  // var backgroundColor;

  IconWidget({Key? key, required this.appcolors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      appcolors,
      color: AppColors.white,
      size: 15,
    );
  }
}
