import 'package:flutter/material.dart';
import 'package:teste/src/ui/theme/app_colors.dart';

import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  IconData? appcolors;
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
