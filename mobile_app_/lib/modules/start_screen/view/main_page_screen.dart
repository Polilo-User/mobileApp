



import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:mobile_app_/modules/start_screen/widgets/widgets.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({ Key? key, required this.BarTitle}) : super(key: key);

  final String BarTitle;

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          widget.BarTitle
        )
      ),
      body: Container(
        child: const MainBottomNavigationBar(),
      )
    );
  }
}
