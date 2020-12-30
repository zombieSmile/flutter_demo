import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const platform = const MethodChannel("test/gotoNewPage");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('跳转iOS页面'),
            onPressed: () {
              platform.invokeMethod("gotoNewPage");
            },
          ),
        ),
      ),
    );
  }
}
