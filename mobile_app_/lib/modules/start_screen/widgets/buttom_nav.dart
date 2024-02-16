

import 'package:flutter/material.dart';
import 'package:mobile_app_/modules/start_screen/widgets/chat.dart';
import 'package:mobile_app_/modules/start_screen/widgets/favorites.dart';
import 'package:mobile_app_/modules/start_screen/widgets/list-builds.dart';
import 'package:mobile_app_/modules/start_screen/widgets/news.dart';

class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _selectedIndex = 0;
  
  static const List<Widget> _widgetOptions = <Widget>[
    ListBuilds(),
    Chat(),
    News(),
    Favorites(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Чат',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'События',
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.more_horiz),
             label: 'Еще'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
