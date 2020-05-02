import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: FormPage(),
    );
  }
}

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();

      _performLogin();
    }
  }

  void _performLogin() {
    final scaffold = _scaffoldKey.currentState;
    scaffold.showSnackBar(
      SnackBar(
        content: Text("Logged in"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Form Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "email"),
                validator: (value) =>
                    !value.contains("@") ? "Invalid email" : null,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "password"),
                validator: (value) =>
                    value.length < 6 ? "Password too short" : null,
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                child: Text("Submit"),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
