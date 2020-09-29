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

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  FocusNode myFocusNode;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(myFocusNode);
    });

    // 设置默认值
    _textEditingController.text = 'Hello Flutter!';
    // 文本监听
    _textEditingController.addListener(() {
      print('textEditingController:${_textEditingController.text}');
    });
    // 选择文本
    _textEditingController.selection = TextSelection(
      baseOffset: 2,
      extentOffset: _textEditingController.text.length,
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          focusNode: myFocusNode,
          decoration: InputDecoration(
            labelText: '用户名',
            hintText: '用户名或邮箱',
            prefixIcon: Icon(Icons.person),
          ),
          controller: _textEditingController,
          onSubmitted: (v) {
            print('onSubmitted: $v');
          },
          onEditingComplete: () {
            print('onEditingComplete');
          },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: '密码',
            hintText: '您的登录密码',
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
          onChanged: (v) {
            print('onChange: $v');
          },
        ),
      ],
    );
  }
}
