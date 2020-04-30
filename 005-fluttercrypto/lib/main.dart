import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    getCurrencies();
  }

  Future<String> getCurrencies() async {
    String cryptoUrl = 'pro-api.coinmarketcap.com';
    String endpoint = '/v1/cryptocurrency/listings/latest';
    var queryParams = {'start': '1', 'limit': '50', 'convert': 'USD'};
    var uri = Uri.https(cryptoUrl, endpoint, queryParams);
    var response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'X-CMC_PRO_API_KEY': 'b9a3c6ff-804d-4a43-b29e-162ca73ef380',
      },
    );
    var data = jsonDecode(response.body);

    if (data['status']['error_code'] != 0) {
      return 'Error';
    }

    setState(() {
      currencies = data['data'];
    });
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CryptoApp"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: ListView.builder(
        itemCount: currencies == null ? 0 : currencies.length,
        itemBuilder: (BuildContext context, int index) {
          final Map currency = currencies[index];
          final MaterialColor color = _colors[index % _colors.length];
          return _getListItemUI(currency, color);
        },
      ),
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text(
        currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }  
}
