import "dart:async";
import 'dart:convert';
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://api.publicapis.org/entries?category=animals";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
        // Encode the URL
        Uri.encodeFull(url),
        headers: {"Accept": "application/json"});

    setState(() {
      Map<String, dynamic> convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson['entries'];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Json with HTTP Get"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Center(
              child: Card(
                margin: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(data[index]["API"], style: TextStyle(fontSize: 24.0)),
                      SizedBox(height: 10),
                      Text(data[index]["Description"], style: TextStyle(fontSize: 16.0)),
                      SizedBox(height: 10),
                      Text(data[index]["Link"], style: TextStyle(fontSize: 12.0)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
