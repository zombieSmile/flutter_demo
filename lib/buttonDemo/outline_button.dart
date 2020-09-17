import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OutlineButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('OutlineButton Demo'),
        ),
        body: OutlineButtonDemo(),
      ),
    );
  }
}

class OutlineButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          OutlineButtonDefault(isDisabled: true),
          SizedBox(height: 30),
          OutlineButtonIcon(),
          SizedBox(height: 30),
          OutlineButtonCustom(),
        ],
      ),
    );
  }
}

class OutlineButtonDefault extends StatelessWidget {
  OutlineButtonDefault({
    Key key,
    this.isDisabled = true,
  }) : super(key: key);

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      // 文本内容
      child: Text('OutlineButton'),
      onPressed: isDisabled ? () {} : null,
    );
  }
}

class OutlineButtonIcon extends StatelessWidget {
  final IconData icon;

  OutlineButtonIcon({
    Key key,
    this.icon = Icons.add_circle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 25.0, color: Colors.red),
      label: Text('图片按钮'),
    );
  }
}

class OutlineButtonCustom extends StatelessWidget {
  OutlineButtonCustom({
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
    return OutlineButton(
      // 文本内容
      child: Text(text),
      // 边框的颜色
      borderSide: BorderSide(
        color: Colors.purple,
        width: 2.0,
      ),
      // 设置无效
      // color: Colors.red,
      // 高亮时背景色
      highlightedBorderColor: Colors.black54,
      // 按钮失效时边框颜色
      disabledBorderColor: Colors.red,
      // 文字颜色
      textColor: Colors.black,
      // 按钮失效时背景色
      disabledTextColor: Colors.grey,
      // 按钮内部，墨汁飞溅的颜色 点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
      splashColor: Colors.transparent,
      // 裁剪， 裁剪等级依次递增：none（默认）hardEdge antiAliasWithSaveLayer antiAlias
      clipBehavior: Clip.antiAlias,
      padding:
          const EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
      // 高亮时候的阴影
      highlightElevation: 0.0,
      // OutLine中只能设置圆角，边框用borderSide
      shape: shape,
      onPressed: () {
        if (_onPressed is VoidCallback) {
          _onPressed();
        }
      },
    );
  }
}
