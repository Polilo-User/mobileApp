


import 'package:mobile_app_/modules/residental-and-communal-compl-filter/bloc/rest_commun_filt_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app_/modules/residental-and-communal-compl-filter/widgets/widgets.dart';


class RestCommunFilter extends StatefulWidget {
  const RestCommunFilter({super.key});

  @override
  State<RestCommunFilter> createState() => _RestCommunFilterState();
}

class _RestCommunFilterState extends State<RestCommunFilter> {

  final _RestCommunFilterBloc = RestCommunFilterBloc();

  @override
  void initState() {
    // добавляем нужный event в bloc
    _RestCommunFilterBloc.add(LoadRoomFilterEvennt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
            Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.8, top: MediaQuery.of(context).size.height * 0.02),
                child:  IconButton( 
                  icon: 
                    SvgPicture.asset(
                        'assets/svg/undo-arrow.svg',
                        width: 40,
                        height: 40,
                    ),
                  onPressed: () {
                      Navigator.of(context).pushNamed('/', arguments: {});
                  },
                ),
              ),
          
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.6, top: 25),
              child:  Text("Фильтры", style: theme.textTheme.bodyMedium,),
            ),
          Expanded(
            child: Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.085 , right: MediaQuery.of(context).size.width * 0.085, top: MediaQuery.of(context).size.height * 0.01),
            child:  BlocBuilder<RestCommunFilterBloc, RestCommunFilterState>(
              bloc: _RestCommunFilterBloc,
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
                          _RestCommunFilterBloc.add(LoadRoomFilterEvennt());
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
                        _RestCommunFilterBloc.add(LoadProgectsFilterEvent());
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
                      Text("Фильтр проектов")
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