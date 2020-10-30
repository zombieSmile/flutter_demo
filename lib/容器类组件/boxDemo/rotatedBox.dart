import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotatedBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RotatedBox Demo'),
        ),
        body: RotatedBoxDemo(),
      ),
    );
  }
}

class RotatedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: RotatedBox(
            quarterTurns: 1,
            child: Text('Hello Flutter'),
          ),
        ),
        Text('Hello', style: TextStyle(color: Colors.orange, fontSize: 20.0))
      ],
    );
  }
}
