



import 'package:flutter/material.dart';


import 'package:mobile_app_/modules/start_screen/widgets/widgets.dart';

// import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';


class MainPageScreen extends StatefulWidget {
  const MainPageScreen({ Key? key, required this.BarTitle}) : super(key: key);

  final String BarTitle;

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<StatefulWidget> {
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
            icon: Icon(Icons.home),
            label: 'Главная',
            backgroundColor:  Color.fromRGBO(35, 79, 104, 1)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Чат',
            backgroundColor:  Color.fromRGBO(35, 79, 104, 1)
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.class_rounded),
            label: 'События',
            backgroundColor:  Color.fromRGBO(35, 79, 104, 1)
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.more_horiz),
             label: 'Еще',
            backgroundColor:  Color.fromRGBO(35, 79, 104, 1)
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
