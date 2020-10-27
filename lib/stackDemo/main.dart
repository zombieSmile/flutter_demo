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
    return Stack(
      children: [
        Image.asset('assets/images/juren.jpeg'),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromRGBO(0, 0, 0, .5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '进击的巨人',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () => print('点击'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
