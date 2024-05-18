




import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_app_/repositories/user_repository/user_repository.dart';
import 'package:mobile_app_/repositories/rooms/favorites_repository.dart';
import 'package:mobile_app_/repositories/rooms/room.dart';


part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {

  final UserRepository userRepository;
  final FavoritesRepository favoritesRepository;

  FavoritesBloc(this.userRepository, this.favoritesRepository) : super(FavoritesInitial()) {


    // показать заглушку или попытаться достать избранное
    on<FavoritesCheckAuth>((event, emit) async {

      if (userRepository.getUser() == null)  {
        emit(FavoritesAuthMissed());
      } else {
        List<Room> rooms = await favoritesRepository.getFavorites();

        if (rooms.length == 0) {
          emit(FavoritesEmpty());
          return;
        }

        emit(FavoritesLoaded(rooms: rooms));
      }

    });



  }
}