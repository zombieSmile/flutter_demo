import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../profile/profile_page.dart';
import '../mall/mall_page.dart';
import '../group/group_page.dart';
import '../subject/subject_page.dart';
import '../home/home_page.dart';

class DBMainPage extends StatefulWidget {
  @override
  _DBMainPageState createState() => _DBMainPageState();
}

class _DBMainPageState extends State<DBMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          DBHomePage(),
          DBSubjectPage(),
          DBGroupPage(),
          DBMallPage(),
          DBProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          createItem('home', '首页'),
          createItem('subject', '书影音'),
          createItem('group', '小组'),
          createItem('mall', '市集'),
          createItem('profile', '我的'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
