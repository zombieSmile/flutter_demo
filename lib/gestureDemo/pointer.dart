import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pointer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PointerD Demo'),
        ),
        // body: PointerDemo(),
        // body: IgnorePointerDemo(),
        body: AbsorbPointerDemo(),
      ),
    );
  }
}

class PointerDemo extends StatefulWidget {
  @override
  _PointerDemoState createState() => _PointerDemoState();
}

class _PointerDemoState extends State<PointerDemo> {
  PointerEvent _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 400,
          height: 400,
          child: Text(
            _event?.toString() ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}

class IgnorePointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: IgnorePointer(
        child: Listener(
          child: Container(
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
          ),
          onPointerDown: (event) => print("in"),
        ),
      ),
      onPointerDown: (event) => print("up"),
    );
  }
}

class AbsorbPointerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            color: Colors.blue,
            width: 200.0,
            height: 200.0,
          ),
          onPointerDown: (event) => print("in"),
        ),
      ),
      onPointerDown: (event) => print("up"),
    );
  }
}

