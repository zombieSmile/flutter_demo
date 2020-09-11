import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State LifeCycle Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('State LifeCycle Demo'),
        ),
        // body: StateLifeCycleWidget(),
        body: Text('测试'),
      ),
    );
  }
}

class StateLifeCycleWidget extends StatefulWidget {
  const StateLifeCycleWidget({
    Key key,
    this.initValue: 0,
  }) : super(key: key);

  final int initValue;

  @override
  _StateLifeCycleWidgetState createState() => _StateLifeCycleWidgetState();
}

class _StateLifeCycleWidgetState extends State<StateLifeCycleWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Center(
      child: FlatButton(
        onPressed: () {
          setState(() {
            // 点击后计数器自增
            ++_counter;
          });
        },
        child: Text('$_counter'),
      ),
    );
  }

  @override
  void didUpdateWidget(StateLifeCycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
