




import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';


class RepositoryListBloc extends Bloc<RepositoryListEvent, ResidenceComplexState> {


    RepositoryListBloc(this.residenceComplexRepository) : super(ResidenceComplexInitial()) {

      on<LoadRepositoryList>((event, emit) async {
        try {

          final residenceComplexes = await residenceComplexRepository.getFilteredResidenceComplexes();

          if (residenceComplexes.isEmpty) {
            emit(ResidenceComplexListEmpty());
            return;
          }

          emit(ResidenceComplexListLoaded(complexList: residenceComplexes));
        }
        catch(e) {
          print(e.toString());
          emit(ResidenceComplexListLoadFailed());
        }


      });
    }

  final ResidenceComplexRepository residenceComplexRepository;

}