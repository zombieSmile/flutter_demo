import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Demo',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container Demo'),
        ),
        body: ContainerDemo(),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0, left: 100),
      constraints: BoxConstraints.tightFor(width: 200.0, height: 100.0),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.red, Colors.orange],
          center: Alignment.center,
          radius: .98,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0),
        ],
      ),
      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      //容器内补白,
      child: Text('10.10',
          style: TextStyle(color: Colors.white, fontSize: 40.0)),
    );
  }
}
