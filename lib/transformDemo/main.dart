import 'package:flutter/material.dart';

import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DecoratedBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transform Demo'),
        ),
        body: TransformDemo(),
      ),
    );
  }
}

class TransformDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          TranslateDemo(),
          SizedBox(height: 100),
          rotateDemo(),
          SizedBox(height: 100),
          ScaleDemo(),
          SizedBox(height: 100),
          Matrix4Demo(),
        ],
      ),
    );
  }
}

class ScaleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.scale(
        scale: 1.5,
        child: Text('Hello Flutter'),
      ),
    );
  }
}

class rotateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      // 旋转90度
      child: Transform.rotate(
        angle: math.pi / 2,
        child: Text('Hello Flutter'),
      ),
    );
  }
}

class TranslateDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      // 默认原点为左上角，右移20像素，向下平移5像素
      child: Transform.translate(
        offset: Offset(20.0, 5.0),
        child: Text('Hello Flutter'),
      ),
    );
  }
}

class Matrix4Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight,
        transform: Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Color(0xFFE8581C),
          child: Text('Apartment for rent!'),
        ),
      ),
    );
  }
}
