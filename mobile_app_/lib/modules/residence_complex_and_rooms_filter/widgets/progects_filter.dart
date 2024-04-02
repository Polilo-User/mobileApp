



import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/Slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/repositories/filters/progect_filters.dart';

class ProgectFilter extends StatefulWidget {
  const ProgectFilter({super.key});

  @override
  State<ProgectFilter> createState() => _ProgectFilterState();
}

class _ProgectFilterState extends State<ProgectFilter> {
  final ProjectFilterRepository roomFilterRepository = GetIt.I<ProjectFilterRepository>();
  @override
  Widget build(BuildContext context) {
    return   
    Column( 
      children: [
        // слайдер стоимости
        MySlider(lable: "Стоимость", units: "млн ₽", min: 6, max: 13, divisions: 7, valueName: "coast", filterRepository: roomFilterRepository),

        // ignore: avoid_unnecessary_containers
         Container(
          child: ElevatedButton(
            onPressed: () {
              print(roomFilterRepository.GetValues());
            },
            child: const Text('Найти проекты', style: TextStyle(color: Colors.white)), // Текст кнопки
          )
        ),

      ]
    );
  }
}