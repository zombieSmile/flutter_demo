import 'package:flutter/material.dart';
import 'pages/main/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣app',
      theme: ThemeData(
        primarySwatch: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: DBMainPage(),
    );
  }
}
