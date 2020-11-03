import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollController Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollControllerDemo(),
    );
  }
}

class ScrollControllerDemo extends StatefulWidget {
  @override
  _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
}

class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
  ScrollController _controller;

  // 是否显示“返回到顶部”按钮
  bool _isShowTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _controller.addListener(() {
      // 打印滚动位置
      print(_controller.offset);
      if (_controller.offset < 1000 && _isShowTopBtn) {
        setState(() {
          _isShowTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && !_isShowTopBtn) {
        setState(() {
          _isShowTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // 为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ScrollController Demo')),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text('$index'));
          },
          itemCount: 100,
          itemExtent: 50.0,
          controller: _controller,
        ),
      ),
      floatingActionButton: !_isShowTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
