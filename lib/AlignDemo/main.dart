import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Align Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Align Demo'),
        ),
        body: AlignDemo(),
      ),
    );
  }
}

class AlignDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          AlignmentDemo(),
          SizedBox(height: 10),
          FractionalOffsetDemo(),
        ],
      ),
    );
  }
}

class AlignmentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120.0,
      // width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.topRight,
        heightFactor: 2,
        widthFactor: 2,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

class FractionalOffsetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: FractionalOffset(0.2, 0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}
