


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

      displayMedium: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 16,
        color: Color.fromRGBO(51, 51, 51, 1.0),
      ),

        displayLarge: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 20,
          color: Color.fromRGBO(51, 51, 51, 1.0),
        ),


        bodySmall: TextStyle(
        fontFamily: "Montserrat",
        fontSize: 14.25,
      ),

      bodyMedium: TextStyle(
          fontFamily: "Montserrat", fontSize: 17),

      labelSmall: TextStyle(
        color: Color.fromRGBO(110, 110, 110, 0.478),
        fontSize: 17,
      ),

      labelLarge: TextStyle(
        fontFamily: "Montserrat", fontSize: 15
      )
    ),
    
    // кнопка
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(35, 79, 104, 1)),
        textStyle: MaterialStateProperty.resolveWith((states) {
            return const TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 13,
            );
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0), // Настройка закругления кнопки
            ),
        ),
      ),
    ),

    // слайдер
    sliderTheme: const SliderThemeData(
      // штука между круглыми штуками
      activeTrackColor:  Color.fromRGBO(35, 79, 104, 1),
      // круглая штука
      thumbColor: Color.fromRGBO(35, 79, 104, 1),
    ),    
    

    //нижняя менюшка на main_page_screen
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        selectedItemColor:   Color.fromRGBO(255, 255, 255, 1),
        unselectedItemColor:  Color.fromRGBO(150, 150, 150, 0.562), 
        unselectedLabelStyle:   TextStyle(color: Color.fromRGBO(35, 79, 104, 1)),
    ),
  );
    