import 'package:flutter/material.dart';
import 'package:fluttersqflite/data/database_helper.dart';
import 'package:fluttersqflite/models/user.dart';
import 'package:fluttersqflite/pages/login/login_presenter.dart';
import 'package:fluttersqflite/router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  
  BuildContext _ctx;
  bool _isLoading;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _username, _password;
  LoginPagePresenter _presenter;
  _LoginPageState() {
    _presenter = LoginPagePresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    
    _ctx = context;
    
    var loginBtn = RaisedButton(
      onPressed: _submit,
      child: Text('Login'),
      color: Colors.green,
    );

    var loginForm = Column(
      children: <Widget>[
        Text("SQFlite App Login", textScaleFactor: 2.0,),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _username = val,
                  decoration: InputDecoration(labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),
              loginBtn,
            ],
          ),
        )
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        child: Center(
          child: loginForm,
        )
      )
    );
  }

  void _submit() {
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_username, _password);
      });
    }
  }

  void _showSnackbar(String text) {
    final scaffold = _scaffoldKey.currentState;

    scaffold.showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  @override
  void onLoginError(String error) {
    _showSnackbar(error);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) async{
    _showSnackbar(user.username);
    setState(() {
      _isLoading = false;
    });
    var db = DatabaseHelper();
    await db.saveUser(user);

    Navigator.of(context).pushNamed(Router.homeRoute);
  }
}