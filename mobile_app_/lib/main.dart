




import 'app.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app_/repositories/filters/filter.dart';
import 'package:mobile_app_/repositories/rooms/room_repository.dart';
import 'package:mobile_app_/repositories/residence_complex/residence_complex_repository.dart';




void main() {

  // Фильтры

    // для запоминия фильтра помещений
    GetIt.I.registerLazySingleton<RoomFilterRepository>(() => (RoomFilterRepository()));

    // для запоминия фильтра проектов
    GetIt.I.registerLazySingleton<ProjectFilterRepository>(() => (ProjectFilterRepository()));

  // Репозитории

    // для запоминия репозитория помещений
    GetIt.I.registerLazySingleton<RoomRepository>(() => (RoomRepository(dio:Dio())));

    // для запоминия репозитория проектов
    GetIt.I.registerLazySingleton<ResidenceComplexRepository>(() => (ResidenceComplexRepository(dio:Dio())));


  runApp(const MobileApp());
}

