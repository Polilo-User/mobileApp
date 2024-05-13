




import 'app.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/repositories/filters/filter.dart';
import 'package:mobile_app_/repositories/rooms/room_repository.dart';
import 'package:mobile_app_/repositories/residence_complex/residence_complex_repository.dart';
import 'package:mobile_app_/repositories/news/news_repository.dart';



void main() {

  // Фильтры

    // фильтр помещений
    GetIt.I.registerLazySingleton<RoomFilterRepository>(() => (RoomFilterRepository()));

    // фильтр проектов
    GetIt.I.registerLazySingleton<ProjectFilterRepository>(() => (ProjectFilterRepository()));

  // Репозитории

    // репозиторий помещений
    GetIt.I.registerLazySingleton<RoomRepository>(() => (RoomRepository(dio:Dio())));

    // репозиторий проектов
    GetIt.I.registerLazySingleton<ResidenceComplexRepository>(() => (ResidenceComplexRepository(dio:Dio())));

    // репозиторий новостей
    GetIt.I.registerLazySingleton<NewsRepository>(() => (NewsRepository(dio:Dio())));

  runApp(const MobileApp());
}

