



import 'package:flutter_bloc/flutter_bloc.dart';
part 'rest_commun_filt_event.dart';
part 'rest_commun_filt_state.dart';


class RestCommunFilterBloc extends Bloc<RestCommunFilterEvent, RestCommunFilterState> {
  RestCommunFilterBloc() : super(RestCommunFilterInitial()) {

    on<LoadProgectsFilterEvent>((event, emit) {
      emit(ProgectFilterState());
    });

    on<LoadRoomFilterEvennt>((event, emit) {
      emit(RoomsFilterState());
    });
  
  }
}