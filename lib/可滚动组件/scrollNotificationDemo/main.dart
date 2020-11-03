import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollNotification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ScrollNotification Demo'),
        ),
        body: ScrollNotificationDemo(),
      ),
    );
  }
}

class ScrollNotificationDemo extends StatefulWidget {
  @override
  _ScrollNotificationDemoState createState() => _ScrollNotificationDemoState();
}

class _ScrollNotificationDemoState extends State<ScrollNotificationDemo> {
  // 保存进度百分比
  String _progress = '0%';

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // 判断监听事件的类型
          if (notification is ScrollStartNotification) {
            print('开始滚动');
          } else if (notification is ScrollUpdateNotification) {
            // 当前滚动的位置和总长度
            double currentPixel = notification.metrics.pixels;
            double totalPixel = notification.metrics.maxScrollExtent;
            double progress = currentPixel / totalPixel;
            setState(() {
              _progress = '${(progress * 100).toInt()}%';
            });
            print(
                "正在滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动....");
          }
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              },
              itemExtent: 50.0,
              itemCount: 100,
            ),
            CircleAvatar(
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
