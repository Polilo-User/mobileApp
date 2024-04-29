


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/modules/residence_complex_and_rooms_filter/bloc/rest_commun_filt_bloc.dart';
import 'package:mobile_app_/modules/residence_complex_list/widgets/widgets.dart' as widgets;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
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
                onRefresh: () async { _repositoryListBloc.add(LoadRepositoryList()); },
                child: BlocBuilder<RepositoryListBloc, RepositoryListState>(
                bloc: _repositoryListBloc,
                builder: (context, state) {


                  if (state is RepositoryListLoaded) {
                    return ListView.builder(
                        itemCount: state.complexList.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed("/residence-complex-screen", arguments: { 'residenceComplex' : state.complexList[i] } );
                                },
                                child: widgets.ResidenceComplex(name: state.complexList[i].name, imgUrl: state.complexList[i].imgUrl)
                            )
                          );
                        }
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

