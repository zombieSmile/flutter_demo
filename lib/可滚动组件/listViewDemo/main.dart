import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView Demo'),
        ),
        body: ListViewDemo(index: 6),
      ),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  ListViewDemo({Key key, this.index = 0}) : super(key: key);

  final index;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return ListViewDefaultDemo();
        break;
      case 1:
        return ListTitleDemo();
        break;
      case 2:
        return ListViewBuilderDemo();
        break;
      case 3:
        return ListViewSeparatedDemo();
        break;
      case 4:
        return InfiniteListView();
        break;
      case 5:
        return HeaderDemo();
        break;
      case 6:
        return ListViewCustom();
        break;
      default:
        return null;
        break;
    }
  }
}

class ListViewDefaultDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}

class ListTitleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          // item前置图标
          leading: Icon(Icons.people, size: 36),
          // item标题
          title: Text("联系人"),
          // item副标题
          subtitle: Text("联系人信息"),
          // item后置图标
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.email, size: 36),
          title: Text("邮箱"),
          subtitle: Text("邮箱地址信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.message, size: 36),
          title: Text("消息"),
          subtitle: Text("消息详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: Icon(Icons.map, size: 36),
          title: Text("地址"),
          subtitle: Text("地址详情信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemExtent: 70.0, // 强制高度为50.0
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('title $index'),
          leading: Icon(Icons.keyboard),
          subtitle: Text('subtitle $index'),
          trailing: Icon(Icons.keyboard_arrow_right),
          // item内容边距
          contentPadding: EdgeInsets.all(10.0),
        );
      },
    );
  }
}

class ListViewSeparatedDemo extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.amber[colorCodes[index]],
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: entries.length,
    );
  }
}

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        // 如果到了表尾
        if (_words[index] == loadingTag) {
          // 不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            // 获取数据
            _retrieveData();
            // 加载时显示loading
            return Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            // 已经加载了100条数据，不再获取数据
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "没有更多了",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        // 显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
            _words.length - 1,
            // 每次生成20个单词
            generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      });
    });
  }
}

class HeaderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text('商品列表')),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(title: Text('$index'));
          }),
        ),
      ],
    );
  }
}

class ListViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.custom(
      childrenDelegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            height: 50.0,
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text('list item $index'),
          );
        },
        childCount: 10,
      ),
    );
  }
}
