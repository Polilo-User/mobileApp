



import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'package:mobile_app_/utils/check_internet_connection.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';



class RepositoryListBloc extends Bloc<RepositoryListEvent, ResidenceComplexState> {

    final ResidenceComplexRepository residenceComplexRepository;

    RepositoryListBloc(this.residenceComplexRepository) : super(ResidenceComplexInitial()) {

      on<LoadRepositoryList>( (event, emit) async {
        try {
          if (! await CheckInternetConnection.internet()) {
            emit(ResidenceComplexListLoadFailed());
          }
          final residenceComplexes = await residenceComplexRepository.getFilteredResidenceComplexes();
          emit(ResidenceComplexListLoaded(complexList: residenceComplexes));
        }
        catch(e) {
          if (e is DioException) {
            final apiError = e.response?.statusCode;
            if (apiError == 404) {
              emit(ResidenceComplexListEmpty());
            }
          }
          else {
            emit(ResidenceComplexListLoadFailed());
          }
        }
      });
  }
}