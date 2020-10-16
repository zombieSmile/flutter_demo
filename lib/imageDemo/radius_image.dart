import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RadiusImage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RadiusImage Demo'),
        ),
        body: RadiusImageDemo(),
      ),
    );
  }
}

class RadiusImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          CircleAvatarImage(),
          SizedBox(height: 10),
          ClipOvalImage(),
          SizedBox(height: 10),
          ClipRRectImage(),
        ],
      ),
    );
  }
}

class CircleAvatarImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 100,
      backgroundImage: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        child: Text('猫头鹰'),
      ),
    );
  }
}

class ClipOvalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
        width: 100,
        height: 100,
      ),
    );
  }
}

class ClipRRectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://tva1.sinaimg.cn/large/ .jpg',
        width: 100,
        height: 100,
      ),
    );
  }
}
