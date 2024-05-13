


import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/room_ask.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/Slider.dart';

import '../../../repositories/filters/room_list_from_residence_complex_filter.dart';
import '../../residence_complex_and_rooms_filter/widgets/hard_back_arrow.dart';
import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart' as models;


class RoomListFromResidenceComplexFilterPage extends StatefulWidget {
  const RoomListFromResidenceComplexFilterPage({super.key});

  @override
  State<RoomListFromResidenceComplexFilterPage> createState() => _RoomListFromResidenceComplexFilterPageState();
}

class _RoomListFromResidenceComplexFilterPageState extends State<RoomListFromResidenceComplexFilterPage> {

  final RoomListFromResidenceComplexFilter roomListFromResidenceComplexFilter  = GetIt.I<RoomListFromResidenceComplexFilter>();


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    final args = ModalRoute.of(context)?.settings.arguments;
    models.ResidenceComplex? residenceCpmplex;
    if (args is! Map) {
      throw Exception("аргументы в args пожалуйста");
    } else {
      residenceCpmplex = args['residenceComplex'] as models.ResidenceComplex?;
      if (residenceCpmplex == null) {
        throw Exception("передай параметр 'residenceComplex' пожалуйста");
      }
    }

    return Scaffold(
      body: Column(
        children: [
          HardBackArrow(),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.085 , right: MediaQuery.of(context).size.width * 0.085, top: MediaQuery.of(context).size.height * 0.01),
                  child:
                  Column(
                      children: [

                        // Количество комнат
                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.47, top: MediaQuery.of(context).size.height * 0.02),
                          child: Text("Количество комнат", style: theme.textTheme.labelLarge),
                        ),
                        Row(
                            children: [
                              // Студия ?
                              RoomAskStud(roomName: "Студия", id: 0, filterRepository: roomListFromResidenceComplexFilter,),

                              // 1 ?
                              RoomAsk(roomName: "1", id: 1, filterRepository: roomListFromResidenceComplexFilter,),

                              // 2 ?
                              RoomAsk(roomName: "2", id: 2, filterRepository: roomListFromResidenceComplexFilter,),

                              // 3 ?
                              RoomAsk(roomName: "3", id: 3, filterRepository: roomListFromResidenceComplexFilter,),

                              // 4 ?
                              RoomAsk(roomName: "4", id: 4, filterRepository: roomListFromResidenceComplexFilter,),

                              // 5 ?
                              RoomAsk(roomName: "5+", id: 5, filterRepository: roomListFromResidenceComplexFilter,)
                            ]
                        ),
                        // Слайдеры стоимости площади и этажа
                        Column(
                            children: [

                              // слайдер стоимости
                              MySlider(lable: "Стоимость", units: "млн ₽", min: 6, max: 13, divisions: 7, valueName: "coast", filterRepository: roomListFromResidenceComplexFilter),

                              // слайдер площади
                              MySlider(lable: "Площадь", units: "м2", min: 37, max: 93, divisions: 56, valueName: "square", filterRepository: roomListFromResidenceComplexFilter),

                              // слайдер Этажей
                              MySlider(lable: "Этаж", units: "", min: 2, max: 16, divisions: 14, valueName: "floor", filterRepository: roomListFromResidenceComplexFilter),

                            ]
                        ),

                        // ignore: avoid_unnecessary_containers
                        Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).popAndPushNamed('/room-list-from-residence-complex', arguments: { 'residenceComplex' : residenceCpmplex });
                              },
                              child: const Text('Найти помещения', style: TextStyle(color: Colors.white)), // Текст кнопки
                            )
                        ),

                      ]
                  )
              )
          ),
        ]
      )

    );

  }
}
