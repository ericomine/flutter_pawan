import 'package:flutter/material.dart';
import 'package:fluttersqflite/models/user.dart';
import 'package:fluttersqflite/pages/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginError
  }

  @override
  void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
  }
}