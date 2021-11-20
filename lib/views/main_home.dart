import 'package:appconcept/constants/colors.dart';
import 'package:appconcept/views/views.dart';
import 'package:appconcept/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentScreen(),
      bottomNavigationBar: CurveBottomNavigationBar(
        child: Row(
          children: [
            bottomBarItem(
              icon: Icons.home_outlined,
              isSelected: currentIndex == 0,
              onSelected: () {
                setState(() => currentIndex = 0);
              },
            ),
            bottomBarItem(
              icon: Icons.location_on_outlined,
              isSelected: currentIndex == 1,
              onSelected: () {
                setState(() => currentIndex = 1);
              },
            ),
            bottomBarItem(
              icon: Icons.coffee_outlined,
              isSelected: currentIndex == 2,
              onSelected: () {
                setState(() => currentIndex = 2);
              },
            ),
            bottomBarItem(
              icon: Icons.person_outline,
              isSelected: currentIndex == 3,
              onSelected: () {
                setState(() => currentIndex = 3);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget? getCurrentScreen() {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      default:
    }
  }

  Widget bottomBarItem(
      {required IconData icon,
      required bool isSelected,
      double size = 30,
      required VoidCallback onSelected}) {
    return Expanded(
      child: IconButton(
        icon: Icon(icon),
        color: isSelected
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.4),
        iconSize: size,
        onPressed: onSelected,
      ),
    );
  }
}
