


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_list/widgets/widgets.dart' as widgets;
import 'package:flutter/material.dart';

import 'package:mobile_app_/modules/residence_complex_list/bloc/repository_list_bloc.dart';
import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart';

import '../widgets/filterIco.dart';

class ResidenceComplexList extends StatefulWidget {
  const ResidenceComplexList({ Key? key }) : super(key: key);

  @override
  _ResidenceComplexListState createState() => _ResidenceComplexListState();
}

class _ResidenceComplexListState extends State<ResidenceComplexList> {

  final _repositoryListBloc = RepositoryListBloc(GetIt.I<ResidenceComplexRepository>());


  @override
  void initState() {
    // добавляем нужный event в bloc
    _repositoryListBloc.add(LoadRepositoryList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            FilterIco(path: '/rest-commun-filter'),
          ],
        ),
        Expanded(
            child:RefreshIndicator(
              onRefresh: () async {
                _repositoryListBloc.add(LoadRepositoryList());
              },
              child: BlocBuilder<RepositoryListBloc, ResidenceComplexState>(
              bloc: _repositoryListBloc,
              builder: (context, state) {

                // если загрузка прошла успешно
                if (state is ResidenceComplexListLoaded) {
                  return ListView.builder(
                      itemCount: state.complexList.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed("/residence-complex-screen", arguments: { 'residenceComplex' : state.complexList[i] } );
                            },
                            child: widgets.ResidenceComplex(
                                complex: state.complexList[i]
                            )
                          )
                        );
                      }
                  );
                }

                // если загрузка не удалась
                if (state is ResidenceComplexListLoadFailed) {
                  return
                    Container(
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

                  if (state is ResidenceComplexListEmpty) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.3,
                        left: MediaQuery.of(context).size.width * 0.1),
                      child: const Text("Не найдено подходящих проектов под параметры фильтра")
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
              }
            )
          )
        ),
      ],
    );
  }
}

