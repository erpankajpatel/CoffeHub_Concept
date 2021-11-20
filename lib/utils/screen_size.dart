import 'package:appconcept/constants/const.dart';
import 'package:flutter/material.dart';

class ScreenSize {
  static ScreenSize size = ScreenSize();
  double _height = 0.0;
  double _width = 0.0;
  double _statusBarHeight = 0.0;
  double _navigationBarHeight = 0.0;

  ScreenSize() {
    _initScreenSize();
  }

  void _initScreenSize() {
    BuildContext context = navigatorKey.currentContext!;
    MediaQueryData data = MediaQuery.of(context);

    _height = data.size.height;
    _width = data.size.width;

    _statusBarHeight = data.padding.top;
    _navigationBarHeight = data.padding.left;
  }

  double get height => _height;

  double get width => _width;

  double get statusBarHeight => _statusBarHeight;

  double get navigationBarHeight => _navigationBarHeight;
}
