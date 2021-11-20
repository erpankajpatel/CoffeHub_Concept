import 'package:appconcept/constants/assets.dart';
import 'package:appconcept/constants/const.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppAssets.logo,
          height: 120,
          width: 120,
          filterQuality: FilterQuality.high,
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: 'COFFEE',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              letterSpacing: letterSpacing,
              fontFamily: fontFamily,
            ),
            children: [
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                text: 'HUB',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                  letterSpacing: letterSpacing,
                  fontWeight: FontWeight.bold,
                  fontFamily: fontFamily,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
