import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView Demo'),
        ),
        body: GridViewDemo(index: 2),
      ),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  GridViewDemo({Key key, this.index = 0}) : super(key: key);

  final index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return CrossAxisCountDemo();
        break;
      case 1:
        return GridViewCountDemo();
        break;
      case 2:
        return CrossAxisExtentDemo();
        break;
      case 3:
        return GridViewExtentDemo();
        break;
      case 4:
        return InfiniteGridViewDemo();
        break;
      default:
        return null;
        break;
    }
  }
}

List<Widget> getGridWidgets() {
  return List.generate(100, (index) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text('item$index',
          style: TextStyle(fontSize: 15, color: Colors.white)),
    );
  });
}

class CrossAxisCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 横轴三个子widget
        childAspectRatio: 1.0, // 子widget宽高比为1
        mainAxisSpacing: 10, // 主轴的间距
        crossAxisSpacing: 10, // 交叉轴的间距
      ),
      children: getGridWidgets(),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      // 横轴三个子widget
      childAspectRatio: 1.0,
      // 子widget宽高比为1
      mainAxisSpacing: 10,
      // 主轴的间距
      crossAxisSpacing: 10,
      // 交叉轴的间距
      children: getGridWidgets(),
    );
  }
}

class CrossAxisExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
      ),
      children: getGridWidgets(),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 100.0,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      childAspectRatio: 1.0,
      children: getGridWidgets(),
    );
  }
}

class InfiniteGridViewDemo extends StatefulWidget {
  @override
  _InfiniteGridViewDemoState createState() => _InfiniteGridViewDemoState();
}

class _InfiniteGridViewDemoState extends State<InfiniteGridViewDemo> {
  List<IconData> _icons = []; // 保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.0,
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        // 如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  // 模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((value) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
