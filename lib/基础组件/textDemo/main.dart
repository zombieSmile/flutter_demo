import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Text Demo'),
        ),
        // body: TextDemo(),
        // body: TextSpanDemo(),
        body: DefaultTextStyleDemo(),
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。',
        textAlign: TextAlign.center, // 所有内容都居中对齐
        // maxLines: 1, // 最多显示行数
        // overflow: TextOverflow.ellipsis, // 超出部分显示...
        // textScaleFactor: 1.25,
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 17.0,
          height: 1.2,
          fontFamily: "Courier",
          background: Paint()..color = Colors.red,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed,
        ),
      ),
    );
  }
}

class TextSpanDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '《定风波》',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          TextSpan(
            text: "\n苏轼",
            style: TextStyle(fontSize: 18, color: Colors.redAccent),
          ),
          TextSpan(
            text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
          ),
        ],
      ),
      style: TextStyle(fontSize: 16, color: Colors.black),
      textAlign: TextAlign.center,
    );
  }
}

class DefaultTextStyleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      // 设置文本默认样式
      style: TextStyle(color: Colors.blue, fontSize: 18),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Hello Text!'),
            Text('Hello TextSpan!'),
            Text(
              'Hello DefaultTextStyle!',
              style: TextStyle(
                inherit: false, // 不继承默认样式
                color: Colors.red,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
