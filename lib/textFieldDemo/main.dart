import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextField Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Demo'),
        ),
        body: TextFieldDemo(),
      ),
    );
  }
}

class TextFieldDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '用户名或邮箱',
            prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '您的登录密码',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
      ],
    );
  }
}


