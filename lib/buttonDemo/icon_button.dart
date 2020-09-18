import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconButton Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('IconButton Demo'),
        ),
        body: IconButtonDemo(),
      ),
    );
  }
}

class IconButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButtonDefault(isDisabled: true),
          SizedBox(height: 30),
          IconButtonCustom(),
          SizedBox(height: 30),
          InkAndIconButton(),
          SizedBox(height: 30),
          VolumeIconButtonStatefulWidget(),
        ],
      ),
    );
  }
}

// IconButton默认按钮示例
class IconButtonDefault extends StatelessWidget {
  IconButtonDefault({
    Key key,
    this.isDisabled = true,
  }) : super(key: key);

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.android),
      color: Colors.blueAccent,
      // 长按显示文案
      tooltip: 'Decrease volume by 10',
      onPressed: isDisabled ? () {} : null,
    );
  }
}

// IconButton自定义示例
class IconButtonCustom extends StatelessWidget {
  IconButtonCustom({Key key, this.color = Colors.blueAccent, this.onPressed})
      : super(key: key);

  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final _onPressed = onPressed;
    return IconButton(
        icon: Icon(Icons.volume_off),
        // 定义图标在IconButton中的定位方式，AlignmentGeometry 如果父Widget尺寸大于child Widget尺寸，这个属性设置会起作用, 有很多种对齐方式
        alignment: AlignmentDirectional.center,
        // 按钮颜色
        color: Colors.lightBlue,
        // 如果图标被禁用，则用于按钮内图标的颜色，默认为当前主题的ThemeData.disabledColor
        disabledColor: Colors.grey,
        // 高亮时背景颜色
        highlightColor: Colors.purple,
        // 图标尺寸
        iconSize: 50.0,
        // 按钮内部，墨汁飞溅的颜色 点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
        splashColor: Colors.transparent,
        padding:
            EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 30.0),
        // 描述按下按钮时将发生的操作文本
        // tooltip: '按下描述文本',
        onPressed: () {
          if (_onPressed is VoidCallback) {
            _onPressed();
          }
        });
  }
}

class InkAndIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.lightBlue,
          ),
          child: IconButton(
            icon: Icon(Icons.android),
            color: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

double _volume = 0.0;

class VolumeIconButtonStatefulWidget extends StatefulWidget {
  @override
  _VolumeIconButtonStatefulWidgetState createState() =>
      _VolumeIconButtonStatefulWidgetState();
}

class _VolumeIconButtonStatefulWidgetState
    extends State<VolumeIconButtonStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume'),
      ],
    );
  }
}
