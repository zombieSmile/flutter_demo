import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StaggerAnimation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StaggerAnimationDemo(),
    );
  }
}

class StaggerAnimationDemo extends StatefulWidget {
  @override
  _StaggerAnimationDemoState createState() => _StaggerAnimationDemoState();
}

class _StaggerAnimationDemoState extends State<StaggerAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _opacityAnimation;
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  Animation<double> _radiansAnimation;

  @override
  void initState() {
    super.initState();
    // 创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Tween
    _opacityAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _sizeAnimation = Tween(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.6, // 间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
    _colorAnimation = ColorTween(
      begin: Colors.orange,
      end: Colors.purple,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.6, // 间隔，前60%的动画时间
          curve: Curves.ease,
        ),
      ),
    );
    _radiansAnimation = Tween(begin: 0.0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          1.0, //间隔，后40%的动画时间
          curve: Curves.ease,
        ),
      ),
    );

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
        title: Text('StaggerAnimation Demo'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value ?? 0.0,
              child: Transform(
                transform: Matrix4.rotationZ(_radiansAnimation.value),
                alignment: Alignment.center,
                child: Container(
                  width: _sizeAnimation.value,
                  height: _sizeAnimation.value,
                  color: _colorAnimation.value,
                ),
              ),
            );
          },
        ),
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
