import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Switch Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Switch Demo'),
        ),
        body: SwitchDemo(),
      ),
    );
  }
}

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _materialSwitchSelected = true;
  bool _cupertinoSwitchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _materialSwitchSelected,
          onChanged: (value) {
            setState(() {
              _materialSwitchSelected = value;
            });
          },
        ),
        CupertinoSwitch(
          value: _cupertinoSwitchSelected,
          onChanged: (value) {
            setState(() {
              _cupertinoSwitchSelected = value;
            });
          },
        )
      ],
    );
  }
}
