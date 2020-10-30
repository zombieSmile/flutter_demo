import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssetImage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AssetImage Demo'),
        ),
        body: AssetImageDemo(),
      ),
    );
  }
}

class AssetImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          AssetImageDefault1(),
          SizedBox(height: 30),
          ImageAssetDefault2(),
        ],
      ),
    );
  }
}

class AssetImageDefault1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/images/avatar.png'),
      width: 200,
      height: 200,
      alignment: Alignment.center,
    );
  }
}

class ImageAssetDefault2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/avatar.png',
      width: 200,
      height: 200,
      alignment: Alignment.center,
    );
  }
}
