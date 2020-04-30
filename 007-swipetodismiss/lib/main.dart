import 'package:flutter/material.dart';
import 'package:swipetodismiss/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
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
  final items = List<String>.generate(30, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe to Dismiss"),
      ),
      body: _buildBody(),      
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) { 
        return Dismissible(
          child: ListTile(
            title: Text(items[index]),
          ),
          key: Key(items[index]),
          onDismissed: (direction) {
            items.removeAt(index);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("Item dismissed."),
              ),
            );
          },
          background: Container(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
