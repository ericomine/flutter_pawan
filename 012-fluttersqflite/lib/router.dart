import 'package:flutter/material.dart';
import 'package:fluttersqflite/main.dart';

class Router {
  static const initialRoute = "/";
  static const homeRoute = "/home";
  static const loginRoute = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case initRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }

}