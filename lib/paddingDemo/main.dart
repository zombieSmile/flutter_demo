import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padding Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Padding Demo'),
        ),
        body: PaddingDemo(),
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // 上下左右各添加16像素补白
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
          Padding(
            // 上下各添加8像素补白
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
