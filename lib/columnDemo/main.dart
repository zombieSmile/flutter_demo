import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Column Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column Demo'),
        ),
        body: ColumnDemo(),
      ),
    );
  }
}

class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: Color(0xfffce4ec),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff8bbd0),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff48fb1),
          width: 90.0,
          height: 50.0,
        ),
        Container(
          color: Color(0xfff06292),
          width: 90.0,
          height: 50.0,
        ),
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
        Text('We will fight up close, seize the moment and stay in it'),
        Text('It’s either that or meet the business end of a bayonet'),
        Text('The code word is ‘Rochambeau,’ dig me?'),
        Text(
          'Rochambeau!',
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
        ),
      ],
    );
  }
}
