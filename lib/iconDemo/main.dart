import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Icon Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Icon Demo'),
        ),
        body: IconDemo(),
      ),
    );
  }
}

class IconDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(Icons.favorite, color: Colors.pink, size: 24.0),
          Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
          Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
        ],
      ),
    );
  }
}
