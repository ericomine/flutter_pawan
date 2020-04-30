import 'package:flutter/material.dart';
import 'package:fluttersqflite/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SQFlite App",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: Router.initialRoute,
    );
  }
}

