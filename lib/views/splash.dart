import 'package:appconcept/constants/assets.dart';
import 'package:appconcept/constants/colors.dart';
import 'package:appconcept/routes/routes.dart';
import 'package:appconcept/utils/utils.dart';
import 'package:appconcept/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigatorToMain();
  }

  void _navigatorToMain() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          _backgroundView(),
          AppLogo(),
        ],
      ),
    );
  }

  Widget _backgroundView() {
    return Container(
      color: AppColors.backgroundColor,
      child: Opacity(
        opacity: 0.05,
        child: Container(
          height: ScreenSize.size.height,
          width: ScreenSize.size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.background),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
