import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '子树中获取State对象',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('子树中获取State对象'),
        ),
        body: Center(
          child: Builder(builder: (context) {
            return RaisedButton(
              onPressed: () {
                // 查找父级最近的Scaffold对应的ScaffoldState对象
                // ScaffoldState _state =
                //     context.findAncestorStateOfType<ScaffoldState>();
                // 直接通过of静态方法来获取ScaffoldState
                ScaffoldState _state=Scaffold.of(context);
                //调用ScaffoldState的showSnackBar来弹出SnackBar
                _state.showSnackBar(
                  // 页底部提示条
                  SnackBar(
                    content: Text("提示提示"),
                  ),
                );
              },
              child: Text("显示SnackBar"),
            );
          }),
        ),
      ),
    );
  }
}
