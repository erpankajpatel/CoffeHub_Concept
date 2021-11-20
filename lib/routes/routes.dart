import 'package:appconcept/views/views.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();
  //
  static const String splash = '/splash';
  static const String main = '/main';
  static const String order = '/order';
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.main:
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case Routes.order:
        return MaterialPageRoute(builder: (_) => OrderPage());
      default:
        return null;
    }
  }
}
