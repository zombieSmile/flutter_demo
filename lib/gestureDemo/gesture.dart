import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gesture Demo'),
        ),
        // body: GestureDetectorDemo(),
        // body: _DragDemo(),
        // body: _ScaleDemo(),
        body: _GestureRecognizerDemo(),
      ),
    );
  }
}

class GestureDetectorDemo extends StatefulWidget {
  @override
  _GestureDetectorDemoState createState() => _GestureDetectorDemoState();
}

class _GestureDetectorDemoState extends State<GestureDetectorDemo> {
  // 保存事件名
  String _operation = "无手势触发!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 200.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        onTap: () => updateText("点击"),
        onDoubleTap: () => updateText("双击"),
        onLongPress: () => updateText("长按"),
      ),
    );
  }

  void updateText(String text) {
    // 更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class _DragDemo extends StatefulWidget {
  @override
  __DragDemoState createState() => __DragDemoState();
}

class __DragDemoState extends State<_DragDemo> {
  // 距离顶部的偏移
  double _top = 0.0;

  // 距离左边的偏移
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text('Drag')),
            // 手指按下回调
            onPanDown: (DragDownDetails detail) {
              // 手指按下的相对于屏幕的位置
              print('用户手指按下：${detail.globalPosition}');
            },
            // 手指滑动回调
            onPanUpdate: (DragUpdateDetails detail) {
              // 手指滑动更新偏移量
              setState(() {
                _left += detail.delta.dx;
                _top += detail.delta.dy;
              });
            },
            // 手指停止滑动回调
            onPanEnd: (DragEndDetails detail) {
              // 滑动结束时在x、y轴上的速度
              print(detail.velocity);
            },
            // // 垂直方向拖动事件
            // onVerticalDragUpdate: (DragUpdateDetails details) {
            //   setState(() {
            //     _top += details.delta.dy;
            //   });
            // },
            // 水平方向拖动事件
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }
}

class _ScaleDemo extends StatefulWidget {
  @override
  __ScaleDemoState createState() => __ScaleDemoState();
}

class __ScaleDemoState extends State<_ScaleDemo> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          color: Colors.red,
          width: _width,
          height: 200.0,
        ),
        onScaleUpdate: (ScaleUpdateDetails detail) {
          // 缩放倍数在0.8到10倍之间
          _width = 200 * detail.scale.clamp(.8, 10.0);
        },
      ),
    );
  }
}

class _GestureRecognizerDemo extends StatefulWidget {
  @override
  __GestureRecognizerDemoState createState() => __GestureRecognizerDemoState();
}

class __GestureRecognizerDemoState extends State<_GestureRecognizerDemo> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  // 变色开关
  bool _toggle = false;

  @override
  void dispose() {
    // GestureRecognizer一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '测试'),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                fontSize: 20.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            TextSpan(text: '测试'),
          ],
        ),
      ),
    );
  }
}
