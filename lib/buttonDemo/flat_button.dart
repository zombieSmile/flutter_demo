import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlatButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FlatButton Demo'),
        ),
        body: FlatButtonDemo(),
      ),
    );
  }
}

class FlatButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButtonDefault(isDisabled: true),
          SizedBox(height: 30),
          FlatButtonIcon(),
          SizedBox(height: 30),
          FlatButtonCustom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

// FlatButton默认按钮示例
class FlatButtonDefault extends StatelessWidget {
  FlatButtonDefault({
    Key key,
    this.isDisabled = true,
  }) : super(key: key);

  // isDisabled： 是否禁用， isDisabled默认true
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      onPressed: isDisabled
          ? () {
              print('点击FlatButton');
            }
          : null,
      child: Text('FlatButton'),
    );
  }
}

// FlatButton图片文字按钮
class FlatButtonIcon extends StatelessWidget {
  FlatButtonIcon({
    Key key,
    this.icon = Icons.add_circle,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 25.0, color: Colors.orange),
      label: Text('图片文字按钮', style: TextStyle(color: Colors.white)),
      color: Colors.black,
    );
  }
}

// FlatButton自定义示例
class FlatButtonCustom extends StatelessWidget {
  FlatButtonCustom({
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
    return FlatButton(
      // 文本内容
      child: Text(text),
      // 按钮颜色
      color: color,
      // 按钮亮度
      colorBrightness: Brightness.dark,
      // 高亮时的背景色
      highlightColor: Colors.yellow,
      // 失效时的背景色
      disabledColor: Colors.grey,
      // 该按钮上的文字颜色，但是前提时不设置字体自身的颜色才会起作用
      textColor: Colors.black,
      // 按钮失效时的文字颜色 同样的不能使用文本自己的样式或者颜色时才会起作用
      disabledTextColor: Colors.white,
      // 按钮内部，墨汁飞溅的颜色 点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
      splashColor: Colors.deepPurple,
      // 裁剪， 裁剪等级依次递增：none（默认）hardEdge antiAliasWithSaveLayer antiAlias
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30, right: 30),
      shape: (shape is ShapeBorder)
          ? shape
          : Border.all(
              // 设置边框样式
              color: Colors.grey,
              width: 2.0,
              style: BorderStyle.solid),
      // 点击事件
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
