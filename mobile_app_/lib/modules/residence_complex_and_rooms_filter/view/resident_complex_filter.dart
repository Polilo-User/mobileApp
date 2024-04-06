



import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_/arguments/filter_argument.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/back_arrow_wihout_path.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/bloc/rest_commun_filt_bloc.dart';



class RestCommunFilter extends StatefulWidget {
  const RestCommunFilter({super.key});

  @override
  State<RestCommunFilter> createState() => _RestCommunFilterState();
}

class _RestCommunFilterState extends State<RestCommunFilter> {

  final _restCommunFilterBloc = RestCommunFilterBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // добавляем нужный event в bloc
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args is! Map) {
      _restCommunFilterBloc.add(LoadRoomFilterEvennt());
    }
    else {
      final filterType = args['previousFilter'] as FilterType?;
      if (filterType == null) {
        _restCommunFilterBloc.add(LoadRoomFilterEvennt());
      }
      else {
        final roomsFilter = {
          FilterType.RoomFilter: () =>
              _restCommunFilterBloc.add(LoadRoomFilterEvennt()),
          FilterType.ResidentComplexFilter: () =>
              _restCommunFilterBloc.add(LoadProgectsFilterEvent()),
        };
        roomsFilter[filterType]!();
      }
    }

    return Scaffold(
      body: Column(
        children: [

          BackArrowWithoutPath(),

          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.6, top: 25),
            child:  Text("Фильтры", style: theme.textTheme.bodyMedium,),
          ),
          Expanded(
            child: Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.085 , right: MediaQuery.of(context).size.width * 0.085, top: MediaQuery.of(context).size.height * 0.01),
            child:  BlocBuilder<RestCommunFilterBloc, RestCommunFilterState>(
              bloc: _restCommunFilterBloc,
              builder: (context, state) {
                    final Row filter =  
                    Row(
                      children: [
                        Container(
                          child: ElevatedButton(
                            style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              state is ProgectFilterState ?  const Color.fromARGB(96, 127, 175, 202) : const Color.fromRGBO(35, 79, 104, 1)
                            )),
                            onPressed: () {
                              _restCommunFilterBloc.add(LoadRoomFilterEvennt());
                            },
                            child: const Text('Помещения', style: TextStyle(color: Colors.white)), // Текст кнопки
                          )
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                        Container(
                          child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              state is RoomsFilterState ?  const Color.fromARGB(96, 127, 175, 202) : const Color.fromRGBO(35, 79, 104, 1)
                            )),
                          onPressed: () {
                            _restCommunFilterBloc.add(LoadProgectsFilterEvent());
                          },
                          child: const Text('Проекты', style: TextStyle(color: Colors.white)),
                        )
                        )

                      ]
                    );

                    // фильтр помещений
                    if (state is RoomsFilterState) {

                      return Column(
                        children: [
                          filter,
                          // виджет фильтра помещений
                          const Expanded(
                            child: RoomsFilter(),
                          )
                        ],
                      );
                    }
                    // фильтр проектов (как я понимаю ЖК комплексов)
                    if (state is ProgectFilterState) {
                      return Column(
                        children: [
                          filter,
                          const Expanded(
                            child: ProgectFilter(),
                          )
                        ],
                      );
                    }
                    return const Center(child: Text("Что-то пошло не так"));
                  }
                ) 
              )
              ),
            ]
          )
      );
  }
}