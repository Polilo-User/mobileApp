





import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


import 'package:mobile_app_/repositories/filters/room_filter_repository.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/room_ask.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/Slider.dart';

class RoomsFilter extends StatefulWidget {
  
  const RoomsFilter({super.key});


  @override
  State<RoomsFilter> createState() => _RoomsFilterState();
}

class _RoomsFilterState extends State<RoomsFilter> {
  
  final RoomFilterRepository roomFilterRepository = GetIt.I<RoomFilterRepository>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
    
    Column( 

      children: [

        // Корпусов в MVP не будет 😎 или будут ?

        // Количество комнат  
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.47, top: MediaQuery.of(context).size.height * 0.02),
          child: Text("Количество комнат", style: theme.textTheme.labelLarge),
        ),
        Row(
          children: [
            // Студия ?
            RoomAskStud(roomName: "Студия", id: 0),

            // 1 ?
            RoomAsk(roomName: "1", id: 1),

            // 2 ?
            RoomAsk(roomName: "2", id: 2,),

            // 3 ?
            RoomAsk(roomName: "3", id: 3),

            // 4 ?
            RoomAsk(roomName: "4", id: 4),

            // 5 ?
            RoomAsk(roomName: "5+", id: 5)
          ]
        ),
        // Слайдеры стоимости площади и этажа 
        Column(  
          children: [

            // слайдер стоимости
            MySlider(lable: "Стоимость", units: "млн ₽", min: 6, max: 13, divisions: 7, valueName: "coast", filterRepository: roomFilterRepository),

            // слайдер площади
            MySlider(lable: "Площадь", units: "м2", min: 37, max: 93, divisions: 56, valueName: "square", filterRepository: roomFilterRepository),

            // слайдер Этажей
            MySlider(lable: "Этаж", units: "", min: 2, max: 16, divisions: 14, valueName: "floor", filterRepository: roomFilterRepository),


          ]
        ),

         // ignore: avoid_unnecessary_containers
         Container(
          child: ElevatedButton(
            onPressed: () {
              //Navigator.of(context).pop();
              Navigator.of(context).popAndPushNamed('/rooms-list');
            },
            child: const Text('Найти помещения', style: TextStyle(color: Colors.white)), // Текст кнопки
          )
        ),

      ]
    );
  }
}

// Этот код просто ужас программиста, но я его пока понимаю.