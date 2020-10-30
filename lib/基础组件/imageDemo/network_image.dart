import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetworkImage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('NetworkImage Demo'),
        ),
        body: NetworkImageDemo(),
      ),
    );
  }
}

class NetworkImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ImageNetWorkDefault1(),
          SizedBox(height: 10),
          ImageNetWorkDefault2(),
        ],
      ),
    );
  }
}

class ImageNetWorkDefault1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      width: 200,
      height: 200,
      alignment: Alignment.center,
    );
  }
}

class ImageNetWorkDefault2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
      width: 200,
      height: 200,
    );
  }
}
