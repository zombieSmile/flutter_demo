import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaisedButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RaisedButton Demo'),
        ),
        body: RaisedButtonDemo(),
      ),
    );
  }
}

class RaisedButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DisabledButton(),
          SizedBox(height: 30),
          EnabledButton(),
          SizedBox(height: 30),
          GradientButton(),
          SizedBox(height: 30),
          RaisedButtonIcon(),
          SizedBox(height: 30),
          RaisedButtonCustom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

// 可点击按钮
class EnabledButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      child: Text('Enabled Button', style: TextStyle(fontSize: 18)),
    );
  }
}

// 不可点击按钮
class DisabledButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      child: Text('Disabled Button', style: TextStyle(fontSize: 18)),
    );
  }
}

// 颜色渐变button
class GradientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: const Text(
          'Gradient Button',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class RaisedButtonIcon extends StatelessWidget {
  RaisedButtonIcon({
    Key key,
    this.icon = Icons.add_circle,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      color: Colors.yellow,
      onPressed: () {},
      icon: Icon(
        icon,
        size: 25.0,
        color: Colors.red,
      ),
      label: Text('图片文字按钮'),
    );
  }
}

// 自定义RaisedButton
class RaisedButtonCustom extends StatelessWidget {
  RaisedButtonCustom({
    Key key,
    this.text = '自定义按钮',
    this.color = Colors.blueAccent,
    this.shape,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Color color;
  final ShapeBorder shape;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return RaisedButton(
      // 文本内容
      child: Text(text),
      // 按钮颜色
      color: color,
      // 按钮亮度
      colorBrightness: Brightness.dark,
      // 高亮时背景颜色
      highlightColor: Colors.yellow,
      // 失效时的背景颜色
      disabledColor: Colors.grey,
      // 该按钮上的文字颜色，但是前提是不设置字体自身的颜色才会起作用
      textColor: Colors.white,
      // 按钮失效上的文字颜色，不能使用文本自己的样式或者颜色时才会起作用
      disabledTextColor: Colors.grey,
      // 按钮内部，墨汁飞溅的颜色 点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
      splashColor: Colors.transparent,
      // 裁剪， 裁剪等级依次递增：none（默认）hardEdge antiAliasWithSaveLayer antiAlias
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
      shape: (shape is ShapeBorder)
          ? shape
          : Border.all(
              // 设置边框样式
              color: Colors.grey,
              width: 2.0,
              style: BorderStyle.solid,
            ),
      // RaisedButton的点击事件
      onPressed: () {
        if (_onPressed is VoidCallback) {
          _onPressed();
        }
      },
      // 改变高亮颜色回调函数，一个按钮会触发两次，按下后改变时触发一次，松手后恢复原始颜色触发一次
      // 参数bool 按下后true 恢复后false
      onHighlightChanged: (isClick) {
        print(isClick);
      },
    );
  }
}
