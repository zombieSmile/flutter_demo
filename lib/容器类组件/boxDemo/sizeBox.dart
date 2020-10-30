import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SizeBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SizeBox Demo'),
        ),
        body: SizeBoxDemo(),
      ),
    );
  }
}

class SizeBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: Container(color: Colors.orange),
      ),
    );
  }
}
