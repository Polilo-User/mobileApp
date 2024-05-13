



import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/resident_complex_and_rooms_filter.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/hard_back_arrow.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/widgets/soft_back_arrow.dart';

import 'package:mobile_app_/modules/rooms_list/widgets/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/rooms/room_repository.dart' as model;
import '../../rooms_list/bloc/repository_list_bloc.dart';

import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart' as models;



class RoomListFromResidenceComplex extends StatefulWidget {
  const RoomListFromResidenceComplex({super.key});

  @override
  State<RoomListFromResidenceComplex> createState() => _RoomListFromResidenceComplexState();
}

class _RoomListFromResidenceComplexState extends State<RoomListFromResidenceComplex> {

  final _repositoryListBloc = RepositoryListBloc(GetIt.I<model.RoomRepository>());


  @override
  void initState() {
    // добавляем нужный event в bloc
    super.initState();
  }

  models.ResidenceComplex? residenceCpmplex;

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is! Map) {
      throw Exception("аргументы в args пожалуйста");
    } else {
      residenceCpmplex = args['residenceComplex'] as models.ResidenceComplex?;
      if (residenceCpmplex == null) {
        throw Exception("передай параметр 'residenceComplex' пожалуйста");
      }
    }
    _repositoryListBloc.add(LoadRepositoryListWithComplex(residenceCpmplex!.id));

    return  Scaffold(
        body: Column(
          children: [
            HardBackArrow(url: '/room-list-from-residence-complex-filter', args: { 'residenceComplex' : residenceCpmplex},),
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
                                child: const Text("Не найдено подходящих проектов под параметры фильтра")
                            );
                          }

                          // если ошибка
                          if (state is RoomsListLoadFailed) {
                            return Container(
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                                child: Column(
                                  children: [
                                    const Center(child: Text("Не удалось загрузить данные")),
                                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                                    ElevatedButton(
                                      onPressed: () { _repositoryListBloc.add(LoadRepositoryList()); },
                                      child: const Text("Повторить попытку", style: TextStyle(color: Colors.white)),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                              const Color.fromRGBO(35, 79, 104, 1)
                                          )),
                                    )
                                  ],
                                )
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
