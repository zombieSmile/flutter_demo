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
          title: Text('NestedScrollView Demo'),
        ),
        body: NestedScrollViewDemo(),
      ),
    );
  }
}

class NestedScrollViewDemo extends StatefulWidget {
  @override
  _NestedScrollViewDemoState createState() => _NestedScrollViewDemoState();
}

class _NestedScrollViewDemoState extends State<NestedScrollViewDemo>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            toolbarHeight: 0.0,
            expandedHeight: 300.0,
            backgroundColor: Colors.transparent,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background:
                  Image.asset('assets/images/juren.jpeg', fit: BoxFit.fill),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this._tabController,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
              ),
            ),
          )
        ];
      },
      body: TabBarView(
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
        controller: _tabController,
      ),
    );
  }
}

class StickTabBarDelegate extends SliverPersistentHeaderDelegate {
  StickTabBarDelegate({@required this.child});

  final TabBar child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
