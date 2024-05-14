






import 'package:mobile_app_/repositories/rooms/room_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../repositories/rooms/models/room.dart';
import 'package:mobile_app_/utils/check_internet_connection.dart';

part 'repository_list_event.dart';
part 'repository_list_state.dart';


class RepositoryListBloc extends Bloc<RepositoryListEvent, RoomsState> {

  final RoomRepository roomRepository;
  RepositoryListBloc(this.roomRepository) : super(RoomsInitial()) {

    on<LoadRepositoryList>((event, emit) async {
      try {
        if (! await CheckInternetConnection.internet()) {
          emit(RoomsListLoadFailed());
        }
        final rooms = await roomRepository.getFilteredRooms();
        if (rooms.length == 0) {
          emit(RoomsListEmpty());
          return;
        }
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

    on<LoadRepositoryListWithComplex>((event, emit) async { // LoadRepositoryListWithComplex
      try {
        if (! await CheckInternetConnection.internet()) {
          emit(RoomsListLoadFailed());
        }
        final rooms = await roomRepository.getFilteredRooms(isFilterWithResidenceComplex: true, buildId: event.buildId);
        if (rooms.length == 0) {
          emit(RoomsListEmpty());
          return;
        }
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