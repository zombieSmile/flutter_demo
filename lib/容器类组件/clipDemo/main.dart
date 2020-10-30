import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Clip Demo'),
        ),
        body: ClipDemo(),
      ),
    );
  }
}

class ClipDemo extends StatelessWidget {
  Widget avatar = Image.asset('assets/images/avatar.png', width: 60.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          avatar,
          ClipOval(child: avatar), // 剪裁为圆形
          ClipRRect(
            // 剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: Align(
                  // 将溢出部分剪裁
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avatar,
                ),
              ),
              Text('Hello Flutter', style: TextStyle(color: Colors.red)),
            ],
          ),
          // DecoratedBox(
          //   decoration: BoxDecoration(color: Colors.red),
          //   child: ClipRect(
          //     clipper: MyClipper(), // 使用自定义的clipper
          //     child: avatar,
          //   ),
          // )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) => false;
}
