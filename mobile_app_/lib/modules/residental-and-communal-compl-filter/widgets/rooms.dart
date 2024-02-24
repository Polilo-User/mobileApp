





import 'package:flutter/material.dart';

import 'package:mobile_app_/modules/residental-and-communal-compl-filter/widgets/room_ask.dart';
import 'package:mobile_app_/modules/residental-and-communal-compl-filter/widgets/Slider.dart';

class RoomsFilter extends StatefulWidget {
  
  const RoomsFilter({super.key});



  @override
  State<RoomsFilter> createState() => _RoomsFilterState();
}

class _RoomsFilterState extends State<RoomsFilter> {
  

    Map<String, RangeValues> valueMap = {
      'coast':  RangeValues(6, 13),
      'square': RangeValues(37, 93),
      'floor':  RangeValues(2, 16),
    };

    // Количество комнат
    List<bool> rooms = [false, false, false, false, false, false];
  
    void updateRoom(bool newAsk, int id) {
        rooms[id] = newAsk;
    }

    void updateCoast(RangeValues newCoast, String name) {
      valueMap[name] = newCoast;
    }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return 
    
    Column( 

      children: [

        // Корпусов в MVP не будет 😎

        // Количество комнат  
        Container(
          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.47, top: MediaQuery.of(context).size.height * 0.02),
          child: Text("Количество комнат", style: theme.textTheme.labelLarge),
        ),
        Row(
          children: [
          // Студия ?
          RoomAskStud(ask: rooms[0], room_name: "Студия", updateAsk: updateRoom, id: 0),

          // 1 ?
          RoomAsk(ask: rooms[1], room_name: "1", updateAsk: updateRoom, id: 1),
          
          // 2 ?
          RoomAsk(ask: rooms[2], room_name: "2", updateAsk: updateRoom, id: 2,),
          
          // 3 ?
          RoomAsk(ask: rooms[3], room_name: "3", updateAsk: updateRoom, id: 3),
          
          // 4 ?
          RoomAsk(ask: rooms[4], room_name: "4", updateAsk: updateRoom, id: 4),
          
          // 5 ?
          RoomAsk(ask: rooms[5], room_name: "5+", updateAsk: updateRoom, id: 5)
      
          ]
        ),
        // Слайдеры стоимости площади и этажа 
        Column(  
          children: [

            // слайдер стоимости
            MySlider(lable: "Стоимость", description: "От 6 до 13 млн ₽", min: 6, max: 13, divisions: 7, values: valueMap['coast'] as RangeValues, valueName: "coast", updateCoast: updateCoast),
            
            // слайдер площади
            MySlider(lable: "Площадь", description: "От 37 до 93 м2", min: 37, max: 93, divisions: 56, values: valueMap['square'] as RangeValues, valueName: "square", updateCoast: updateCoast),

            // слайдер Этажей
            MySlider(lable: "Этаж", description: "От 2 до 16", min: 2, max: 16, divisions: 14, values: valueMap['floor'] as RangeValues, valueName: "floor", updateCoast: updateCoast, ),

          ]
        ),

         // ignore: avoid_unnecessary_containers
         Container(
          child: ElevatedButton(
            onPressed: () {
              print(" ${rooms}, стоимость ${valueMap['coast'] as RangeValues}, этаж ${valueMap['floor'] as RangeValues}, площадь ${valueMap['square'] as RangeValues}");
            },
            child: const Text('Найти помещения', style: TextStyle(color: Colors.white)), // Текст кнопки
          )
        ),

      ]
    );
  }
}