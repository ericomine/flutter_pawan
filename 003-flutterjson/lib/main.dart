import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    ));

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List data;

    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json App"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('load_json/person.json'),
            builder: (context, snapshot) {
              // Decode Json
              var myData = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text("Name: " + myData[index]["name"]),
                        Text("Age: " + myData[index]["age"].toString()),
                        Text("Height: " + myData[index]["height"].toString()),
                        Text("Gender: " + myData[index]["gender"]),
                        Text("Hair Color: " + myData[index]["hair_color"]),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
