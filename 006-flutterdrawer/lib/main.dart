import 'package:flutter/material.dart';
import 'package:flutterdrawer/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer App"),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      elevation: 5.0,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text("E"),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.brown,
                child: Text("O"),
              )
            ],
            accountName: Text("Eric"),
            accountEmail: Text("eric.omine@gmail.com"),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            title: Text("Page One"),
            trailing: Icon(Icons.arrow_upward),
            onTap: () => Navigator.of(context).pushNamed("/pageOne"),
          ),
          ListTile(
            title: Text("Page Two"),
            trailing: Icon(Icons.arrow_downward),
            onTap: () => Navigator.of(context).pushNamed("/pageTwo"),
          ),
          Divider(),
          ListTile(
            title: Text("Close"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Center(
        child: Text("Home Page"),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String title;
  Page(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}