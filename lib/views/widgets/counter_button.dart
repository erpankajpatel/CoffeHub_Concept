import 'package:appconcept/constants/colors.dart';
import 'package:flutter/material.dart';

enum CurveSide { left, right, none }

class CounterButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final CurveSide curveSide;

  const CounterButton(
      {Key? key,
      this.curveSide = CurveSide.none,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  factory CounterButton.left(
      {required IconData icon, required VoidCallback onPressed}) {
    return CounterButton(
      icon: icon,
      curveSide: CurveSide.left,
      onPressed: onPressed,
    );
  }

  factory CounterButton.right(
      {required IconData icon, required VoidCallback onPressed}) {
    return CounterButton(
      icon: icon,
      curveSide: CurveSide.right,
      onPressed: onPressed,
    );
  }

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      borderRadius: _borderRadius(),
      child: Container(
        height: 28,
        width: 30,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: _borderRadius(),
        ),
        child: Padding(
          padding: _padding(),
          child: Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  EdgeInsets _padding() {
    switch (widget.curveSide) {
      case CurveSide.left:
        return EdgeInsets.only(left: 5);
      case CurveSide.right:
        return EdgeInsets.only(right: 5);
      case CurveSide.none:
        return EdgeInsets.zero;
      default:
        return EdgeInsets.zero;
    }
  }

  BorderRadius _borderRadius() {
    switch (widget.curveSide) {
      case CurveSide.left:
        return BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        );
      case CurveSide.right:
        return BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        );
      case CurveSide.none:
        return BorderRadius.zero;
      default:
        return BorderRadius.zero;
    }
  }
}
