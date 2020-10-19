import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack Demo'),
        ),
        // body: StackDemo(),
        body: PositionedDemo(),
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            color: Colors.redAccent,
          ),
          Container(
            width: 90,
            height: 90,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 80,
            color: Colors.orangeAccent,
          )
        ],
      ),
    );
  }
}

class PositionedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, // 指定未定位或部分定位widget的对齐方式
        // fit: StackFit.expand,     //未定位widget占满Stack整个空间
        children: <Widget>[
          Container(
            child: Text('Hello Flutter', style: TextStyle(color: Colors.pink)),
            color: Colors.blue,
          ),
          Positioned(
            left: 18.0,
            child: Text('I am wang'),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          ),
        ],
      ),
    );
  }
}
