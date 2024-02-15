

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class MainBottomNavigationBar extends StatefulWidget {
  const MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      '1. Здесь будет крутая недвижемость',
      style: optionStyle,
    ),
    Text(
      '2. Здесь будет чат',
      style: optionStyle,
    ),
    Text(
      '3. Здесь будут новости',
      style: optionStyle,
    ),
    Text(
      '4. Здесь будет избранное и еще что-то',
      style: optionStyle,
    ),
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
