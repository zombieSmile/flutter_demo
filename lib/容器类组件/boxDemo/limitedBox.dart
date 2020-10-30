import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LimitedBox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('LimitedBox Demo'),
        ),
        // body: LimitedBoxDemo(),
        body: LimitedBoxDemo1(),
      ),
    );
  }
}

class LimitedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          child: Text('Column下效果'),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Color(0xfff8bbd0),
          child: Text('100 * 100', style: TextStyle(color: Colors.white)),
        ),
        LimitedBox(
          maxWidth: 100,
          maxHeight: 100,
          child: Container(
            width: 250,
            height: 300,
            child: Text('250 * 300', style: TextStyle(color: Colors.white)),
            color: Color(0xfff48fb1),
          ),
        )
      ],
    );
  }
}

class LimitedBoxDemo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          child: Text('Row下效果'),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          color: Color(0xfff8bbd0),
          child: Text('100 * 100', style: TextStyle(color: Colors.white)),
        ),
        LimitedBox(
          maxWidth: 100,
          maxHeight: 100,
          child: Container(
            width: 250,
            height: 300,
            child: Text('250 * 300', style: TextStyle(color: Colors.white)),
            color: Color(0xfff48fb1),
          ),
        )
      ],
    );
  }
}
