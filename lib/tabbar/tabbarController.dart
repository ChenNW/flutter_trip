import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class myTabbar extends StatefulWidget {
  @override
  _mytabbar createState() => _mytabbar();
}

class _mytabbar extends State<myTabbar> {
  final PageController _pageController = PageController(initialPage: 0,);

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _items,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      body: PageView(
        controller: _pageController,
        children: _controllers,
      ),

    );
  }
}

final List<BottomNavigationBarItem> _items = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home), activeIcon: Icon(Icons.home), title: Text('首页')),
  BottomNavigationBarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search),
      title: Text('搜索')),
  BottomNavigationBarItem(
      icon: Icon(Icons.camera_alt),
      activeIcon: Icon(Icons.camera_alt),
      title: Text('旅拍')),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      activeIcon: Icon(Icons.account_circle),
      title: Text('我的')),
];

final List <Widget>_controllers = [
  home_page(),
  search_page(),
  travel_page(),
  my_page()

];