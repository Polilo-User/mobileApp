





import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/repositories/filters/filter.dart';
import 'app.dart';



void main() {
  // для запоминия фильтра помещений
  GetIt.I.registerLazySingleton<RoomFilterRepository>(() => (RoomFilterRepository()));
  
  // для запоминия фильтра проектов
  GetIt.I.registerLazySingleton<ProjectFilterRepository>(() => (ProjectFilterRepository()));

  runApp(const MobileApp());
}

