import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Demo'),
        ),
        body: FormDemo(),
      ),
    );
  }
}

class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(27, 18, 27, 0),
      child: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormState
        autovalidate: true, // 开启自动校验
        child: Column(
          children: <Widget>[
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              autofocus: true,
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: '请输入手机号',
                icon: Image.asset('assets/images/telephone.png'),
              ),
              // 校验用户名
              validator: (value) {
                return value.trim().length > 0 ? null : '用户名不能为空';
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: '请输入密码',
                icon: Image.asset('assets/images/password.png'),
              ),
              obscureText: true,
              // 校验密码
              validator: (value) {
                return value.trim().length > 5 ? null : '密码不能少于6位';
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(27, 30, 27, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text('登录'),
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        // 通过_formKey.currentState 获取FormState后
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if((_formKey.currentState as FormState).validate()) {
                          // 验证通过提交数据
                          print('验证通过');
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
