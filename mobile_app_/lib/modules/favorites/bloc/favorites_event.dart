





part of 'favorites_bloc.dart';




abstract class FavoritesEvent {}


class FavoritesLoginCheck extends FavoritesEvent {}


// проверить авторизован ли пользователь
class FavoritesCheckAuth extends FavoritesEvent {}