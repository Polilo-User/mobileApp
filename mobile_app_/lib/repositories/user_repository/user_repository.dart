




import 'package:dio/dio.dart';

import 'package:mobile_app_/repositories/user_repository/model/user.dart';
import 'package:mobile_app_/repositories/rooms/room.dart';


class UserRepository {
  final Dio dio;
  UserRepository({required this.dio});

  // добавить в избранное помещение
  Future<void> addToFavorites({required Room room}) async {
  }

  // удалить из избранного помещение
  Future<void> removeFromFavorites({required Room room}) async {
  }

  // получить список избранных помещений
  Future<List<Room>> getFavorites() async {
    List<Room> favoritesRooms = [];

    return favoritesRooms;
  }

  // запишет токен в локальное хранилище/бд
  Future<dynamic> userAuth({required String login, required String password}) async {

    // ошибка аутентификации
    return false;

    // без ошибки аутентификации
    return '';
  }

}