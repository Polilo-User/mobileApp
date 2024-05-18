





part of 'favorites_bloc.dart';



abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}


// заглушка
class FavoritesAuthMissed extends FavoritesState {}

// загрузить избранное
class FavoritesLoaded extends FavoritesState {
  List<Room> rooms;
  FavoritesLoaded({required this.rooms});
}

// если у пользователя в избранном пусто
class FavoritesEmpty extends FavoritesState {}