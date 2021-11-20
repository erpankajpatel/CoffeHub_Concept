import 'package:appconcept/constants/colors.dart';
import 'package:appconcept/constants/const.dart';
import 'package:flutter/material.dart';

class Style {
  Style._();

  // Default Theme
  static ThemeData theme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: fontFamily,
      splashColor: AppColors.primaryColor.withOpacity(0.15),
      highlightColor: AppColors.primaryColor.withOpacity(0.15),
    );
  }
}
