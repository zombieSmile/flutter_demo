import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FadeInImage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FadeInImage Demo'),
        ),
        body: FadeImageDemo(),
      ),
    );
  }
}

class FadeImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage(
        placeholder: AssetImage('assets/images/avatar.png'),
        image: NetworkImage(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
        fadeInDuration: Duration(milliseconds: 1),
        fadeOutDuration: Duration(milliseconds: 1),
        width: 200,
        height: 200,
      ),
    );
  }
}
