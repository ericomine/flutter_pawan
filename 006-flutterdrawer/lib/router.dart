import "package:flutter/material.dart";
import 'package:flutterdrawer/main.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/pageOne':
        return MaterialPageRoute(builder: (_) => Page("one"));
      case '/pageOne':
        return MaterialPageRoute(builder: (_) => Page("two"));
      default:
        return MaterialPageRoute(
          builder: (_) => Container(
            child: Center(
              child: Text("Error"),
            ),
          ),
        );
    }
  }
}
