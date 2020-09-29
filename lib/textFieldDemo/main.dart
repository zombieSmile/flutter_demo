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
        SizedBox(height: 30),
        CustomTextFieldDemo(),
      ],
    );
  }
}

class CustomTextFieldDemo extends StatefulWidget {
  @override
  _CustomTextFieldDemoState createState() => _CustomTextFieldDemoState();
}

class _CustomTextFieldDemoState extends State<CustomTextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: 300,
            height: 41,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(15, 13, 20, 0),
                fillColor: Colors.white,
                filled: true,
                hintText: '请输入手机号',
                hintStyle: TextStyle(
                    color: Color.fromRGBO(153, 153, 153, 1.0), fontSize: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(197, 197, 197, 1.0), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(197, 197, 197, 1.0), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
