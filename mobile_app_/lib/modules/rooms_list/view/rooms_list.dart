


import 'package:flutter/material.dart';

import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/widgets.dart';
import 'package:mobile_app_/modules/residence_complex_screen/widgets/rooms.dart';
import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';

import 'package:mobile_app_/arguments/filter_argument.dart';

import 'package:mobile_app_/modules/rooms_list/bloc/repository_list_bloc.dart';

import 'package:mobile_app_/repositories/rooms/room.dart' as model;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RoomsList extends StatefulWidget {
  const RoomsList({super.key});

  @override
  State<RoomsList> createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {

  final _repositoryListBloc = RepositoryListBloc(GetIt.I<model.RoomRepository>());

  @override
  void initState() {
    // добавляем нужный event в bloc
    _repositoryListBloc.add(LoadRepositoryList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            HardBackArrow(url: '/rest-commun-filter' , args: const {'previousFilter': FilterType.RoomFilter}),
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.08, top: MediaQuery.of(context).size.height * 0.02, bottom: MediaQuery.of(context).size.height * 0.02),
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Text("Квартиры", style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async { _repositoryListBloc.add(LoadRepositoryList()); },
                child: BlocBuilder<RepositoryListBloc, RoomsState>(
                  bloc: _repositoryListBloc,
                  builder: (context, state) {
                    print(state.toString());
                    // если загрузка прошла успешно
                    if (state is RoomsListLoaded) {
                      return ListView.builder(
                          itemCount: state.roomsList.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              title: InkWell(
                                  child: Room(room: state.roomsList[i]),
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/room-screen", arguments: { 'room' : state.roomsList[i] } );
                                  }
                              ),
                            );
                          }
                      );
                    }

                    // если не нашлось подходящих квартир
                    if (state is RoomsListEmpty) {
                      return Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3,
                              left: MediaQuery.of(context).size.width * 0.1),
                          child: Text("Не найдено подходящих проектов под параметры фильтра")
                      );
                    }

                    // если ошибка
                    if (state is RoomsListLoadFailed) {
                      return Container(
                        child: Text("Не удалось загрузить данные")
                      );
                    }


                    return const Center(child: CircularProgressIndicator());
                })
              )
            )
          ],
        )
    );
  }
}





