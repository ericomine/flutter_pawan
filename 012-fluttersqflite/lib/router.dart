import 'package:flutter/material.dart';
import 'package:fluttersqflite/pages/home_page.dart';
import 'package:fluttersqflite/pages/login/login_page.dart';

class Router {
  static const initialRoute = "/";
  static const homeRoute = "/home";
  static const loginRoute = "/login";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }

}