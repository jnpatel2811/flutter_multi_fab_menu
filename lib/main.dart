import 'package:flutter/material.dart';
import 'package:unicorndial/unicorndial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Fab Menu Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Multi Fab Menu Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text("Press  FAB icon")),
      floatingActionButton: UnicornDialer(
        parentButtonBackground: Colors.grey[700],
        orientation: UnicornOrientation.HORIZONTAL,
        parentButton: Icon(Icons.person),
        childButtons: _getProfileMenu(),
      ),
    );
  }

  Widget _profileOption({IconData iconData, Function onPressed}) {
    return UnicornButton(
        currentButton: FloatingActionButton(
      backgroundColor: Colors.grey[500],
      mini: true,
      child: Icon(iconData),
      onPressed: onPressed,
    ));
  }

  List<UnicornButton> _getProfileMenu() {
    List<UnicornButton> children = [];

    children.add(_profileOption(iconData: Icons.account_balance, onPressed: () {}));
    children.add(_profileOption(iconData: Icons.settings, onPressed: () {}));
    children.add(_profileOption(iconData: Icons.subdirectory_arrow_left, onPressed: () {}));

    return children;
  }
}
