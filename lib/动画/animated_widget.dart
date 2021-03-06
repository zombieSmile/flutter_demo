import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _curvedAnimation;
  Animation _sizeAnimation;

  @override
  void initState() {
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // 设置Curve的值
    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    // Tween
    _sizeAnimation = Tween(begin: 50.0, end: 150.0).animate(_curvedAnimation);

    // 监听动画状态改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Demo'),
      ),
      body: Center(
        child: _AnimatedIcon(_sizeAnimation),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
            print(_controller.status);
          } else if (_controller.status == AnimationStatus.forward) {
            _controller.forward();
          } else if (_controller.status == AnimationStatus.reverse) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // 释放动画资源
    _controller.dispose();
    super.dispose();
  }
}

class _AnimatedIcon extends AnimatedWidget {
  _AnimatedIcon(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: animation.value,
    );
  }
}
