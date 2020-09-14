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
        body: HomeTextBody(),
      ),
    );
  }
}

class HomeTextBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。',
      textAlign: TextAlign.center, // 所有内容都居中对齐
//      maxLines: 1, // 最多显示行数
//      overflow: TextOverflow.ellipsis, // 超出部分显示...
      textScaleFactor: 1.25,
    );
  }
}
