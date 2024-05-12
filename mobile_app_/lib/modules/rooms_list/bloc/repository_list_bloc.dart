





import 'package:mobile_app_/repositories/rooms/room_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../repositories/rooms/models/room.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';


class RepositoryListBloc extends Bloc<RepositoryListEvent, RoomsState> {

  final RoomRepository roomRepository;

  RepositoryListBloc(this.roomRepository) : super(RoomsInitial()) {

    on<LoadRepositoryList>((event, emit) async {
      try {
        final rooms = await roomRepository.getFilteredRooms(); // await roomRepository.getFilteredResidenceComplexes();
        emit(RoomsListLoaded(roomsList: rooms));
      }
      catch(e) {
        if (e is DioException) {
          if (e.response?.statusCode == 404) {
            emit(RoomsListEmpty());
          }
        }
        else {
          emit(RoomsListLoadFailed());
        }
      }
    });
  }
}