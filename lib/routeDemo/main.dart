import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        '/': (context) => FirstPage(),
        'secondPage': (context) => SecondPage(text: ModalRoute.of(context).settings.arguments),
        // 省略其它路由注册信息
      },
      // 名为"/"的路由作为应用的home(首页)
      initialRoute: '/',
      // home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('返回传参：$_text'),
            RaisedButton(
              onPressed: () => _goToSecondPage(context),
              child: Text('下一页'),
            ),
          ],
        ),
      ),
    );
  }

  void _goToSecondPage(BuildContext context) {
    Navigator.pushNamed(context, 'secondPage', arguments: '第二页').then((value) {
      setState(() {
        _text = value;
      });
    });
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return SecondPage(text: '第二页');
    // })).then((value) {
    //   setState(() {
    //     _text = value;
    //   });
    // });
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    // 获取参数
    // var args = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, '返回值');
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('第二页'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back_ios),
          //   onPressed: () {
          //     Navigator.pop(context, '返回值');
          //   },
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text ?? ''),
              RaisedButton(
                onPressed: () => Navigator.pop(context, '返回值'),
                child: Text('返回'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
