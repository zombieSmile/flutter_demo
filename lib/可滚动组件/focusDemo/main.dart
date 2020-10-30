import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Focus Demo'),
        ),
        body: FocusDemo(),
      ),
    );
  }
}

class FocusDemo extends StatefulWidget {
  @override
  _FocusDemoState createState() => _FocusDemoState();
}

class _FocusDemoState extends State<FocusDemo> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            // 关联focusNode1
            focusNode: focusNode1,
            decoration: InputDecoration(labelText: 'input1'),
          ),
          TextField(
            // 关联focusNode2
            focusNode: focusNode2,
            decoration: InputDecoration(labelText: 'input1'),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    // 将焦点从第一个TextField移到第二个TextField
                    if (null == focusScopeNode) {
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                  child: Text('移动焦点'),
                ),
                RaisedButton(
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                  child: Text('隐藏键盘'),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
