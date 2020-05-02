import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _appState = state;
      print("My app state is $_appState");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Lifecycle",
      home: Scaffold(
        body: Center(
          child: OrientationBuilder(
            builder: (_, orientation) {
              return Text(
                "App state: " + _appState.toString(),
                style: TextStyle(
                    fontSize: 32.0,
                    color: orientation == Orientation.portrait
                        ? Colors.blue
                        : Colors.red),
              );
            },
          ),
        ),
      ),
    );
  }
}
