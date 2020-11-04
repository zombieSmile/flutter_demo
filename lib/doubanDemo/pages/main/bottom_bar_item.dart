import 'package:flutter/material.dart';

BottomNavigationBarItem createItem(String imageName, String title) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      'assets/images/tabbar/$imageName.png',
      width: 30,
      gaplessPlayback: true,
    ),
    activeIcon: Image.asset(
      'assets/images/tabbar/${imageName}_active.png',
      width: 30,
      gaplessPlayback: true,
    ),
    label: title,
  );
}
