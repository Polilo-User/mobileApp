




import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:mobile_app_/repositories/rooms/room.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/user.dart';


class UserRepository {
  final Dio dio;
  final SharedPreferences prefs;


  UserRepository({required this.dio, required this.prefs});

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

  // получит и запишет токен в локальное хранилище/бд
  Future<User?> userAuth({required String login, required String password}) async {

    var response;

    try {
      response = await dio.post(
        'http://185.104.114.7:8095/authorization/login',
        data: json.encode({
          "phone": int.parse(login),
          "password": password
        }),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
    } catch(e) {

      if (e is DioException) {
        final apiError = e.response?.statusCode;

        // ошибка аутентификации
        if (apiError == 418) {
          return null;
        }
      }
      return null;

    }

    final data = response.data as Map<String, dynamic>;

    prefs.setString('accessToken', data['accessToken']);
    prefs.setString('refreshToken', data['refreshToken']);
    prefs.setString('fio', data['fio']);

    // без ошибки аутентификации
    return User(accessToken: data['accessToken'], refreshToken: data['refreshToken'], fio: data['fio']);
  }

  User? getUser() {

    String? accessToken  = prefs.getString('accessToken');
    String? refreshToken = prefs.getString('refreshToken');
    String? fio          = prefs.getString('fio');

    if (accessToken == null || refreshToken == null || fio == null) {
      return null;
    }

    User user = User(accessToken: accessToken, refreshToken: refreshToken, fio: fio);
    return user;
  }

  Future<void> logout() async {
    await prefs.remove('accessToken');
    await prefs.remove('refreshToken');
    await prefs.remove('fio');
  }

}