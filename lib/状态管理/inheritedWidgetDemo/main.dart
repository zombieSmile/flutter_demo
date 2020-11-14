import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('InheritedWidget Demo'),
        ),
        body: CounterWidget(
          counter: _counter,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ShowData1(), ShowData2()],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
      ),
    );
  }
}

class CounterWidget extends InheritedWidget {
  CounterWidget({Widget child, this.counter}) : super(child: child);

  final int counter;

  static CounterWidget of(BuildContext context) {
    // 沿着Element树，去找最近的CounterElement 从Element中取出的Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 如果返回true：执行依赖当前的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(covariant CounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}

class ShowData1 extends StatefulWidget {
  @override
  _ShowData1State createState() => _ShowData1State();
}

class _ShowData1State extends State<ShowData1> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies执行');
  }

  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    return Card(
      color: Colors.red,
      child: Text('当前计数：$counter', style: TextStyle(fontSize: 30)),
    );
  }
}

class ShowData2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = CounterWidget.of(context).counter;
    return Container(
      color: Colors.blue,
      child: Text(
        '当前计数：$counter',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
