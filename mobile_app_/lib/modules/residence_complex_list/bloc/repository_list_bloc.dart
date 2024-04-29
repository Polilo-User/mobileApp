




import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app_/repositories/residence_complex/redince_complex.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';


class RepositoryListBloc extends Bloc<RepositoryListEvent, RepositoryListState> {


    RepositoryListBloc(this.residenceComplexRepository) : super(CryptoListInitial()) {

      on<LoadRepositoryList>((event, emit) async {
        try {

          final residenceComplexes = await residenceComplexRepository.getFilteredResidenceComplexes();
          emit(RepositoryListLoaded(complexList: residenceComplexes));
        }
        catch(e) {

          emit(RepositoryListError());
        }


      });
    }

  final ResidenceComplexRepository residenceComplexRepository;

}