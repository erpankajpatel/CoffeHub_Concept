import 'package:appconcept/constants/colors.dart';
import 'package:appconcept/constants/const.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double fontSize;
  final double height;
  final double? width;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.width = 180,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(1, 10),
          ),
        ],
      ),
      child: MaterialButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 16, letterSpacing: letterSpacing),
        ),
        height: height,
        minWidth: width,
        onPressed: onPressed,
        color: AppColors.primaryColor,
        textColor: Colors.white,
        shape: StadiumBorder(),
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        disabledElevation: 0,
        splashColor: Colors.white.withOpacity(0.15),
        highlightColor: Colors.white.withOpacity(0.15),
      ),
    );
  }
}
