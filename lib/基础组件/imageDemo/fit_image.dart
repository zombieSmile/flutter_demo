import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitImage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('FitImage Demo'),
        ),
        body: FitImageDemo(),
      ),
    );
  }
}

class FitImageDemo extends StatelessWidget {
  final imageName = 'assets/images/avatar.png';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Image>[
          Image.asset(
            imageName,
            height: 50,
            width: 50,
            fit: BoxFit.fill,
          ),
          Image.asset(
            imageName,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 50,
            fit: BoxFit.cover,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 50,
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 50,
            fit: BoxFit.scaleDown,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 50,
            fit: BoxFit.none,
          ),
          Image.asset(
            imageName,
            width: 100,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
          ),
          Image.asset(
            imageName,
            width: 100,
            height: 200,
            repeat: ImageRepeat.repeatY,
          ),
        ].map((e) {
          return Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString()),
            ],
          );
        }).toList(),
      ),
    );
  }
}
