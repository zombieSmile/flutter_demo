import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConstrainedBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ConstrainedBox Demo'),
        ),
        body: ConstrainedBoxDemo(currentWidth: 100),
      ),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  ConstrainedBoxDemo({
    Key key,
    this.currentWidth,
    this.describe = 'ConstrainedBox',
  }) : super(key: key);

  final double currentWidth;
  final String describe;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 100.0,
        minHeight: 20.0,
        maxWidth: 300.0,
        maxHeight: 100.0,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        //  child 宽高超过指定限制范围失效
        width: currentWidth,
        height: 250.0,
        child: Text(describe, style: TextStyle(color: Colors.white)),
        color: Color(0xfff8bbd0),
      ),
    );
  }
}
