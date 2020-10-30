import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SingleChildScrollView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('SingleChildScrollView Demo'),
        ),
        body: SingleChildScrollViewDemo(),
      ),
    );
  }
}

class SingleChildScrollViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "123456789987654321";
    // 显示进度条
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // 动态创建一个List<Widget>
            children: str
                .split("")
                .map((c) => Text(c, textScaleFactor: 2.0))
                .toList(),
          ),
        ),
      ),
    );
  }
}
