


import 'package:flutter/material.dart';

final whiteTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 86, 160, 245),
      titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontFamily: "Roboto", fontSize: 20, fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
        color: Color.fromRGBO(110, 110, 110, 0.478),
        fontSize: 20,
      )),
    // нижняя менюшка на main_page_screen
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color.fromARGB(255, 129, 190, 240),
      unselectedItemColor: Color.fromARGB(255, 110, 110, 110),
    ),
  );
    