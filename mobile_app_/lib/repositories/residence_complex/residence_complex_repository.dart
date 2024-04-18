




import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import './models/residence_complex.dart';
import 'package:mobile_app_/repositories/filters/progect_filters.dart';

class ResidenceComplexRepository {

  final ProjectFilterRepository filter = GetIt.I<ProjectFilterRepository>();
  Dio dio;

  ResidenceComplexRepository({required this.dio});

  Future<List<ResidenceComplex>> getResidenceComplexes() async {
    List<ResidenceComplex> residenceComplexes = [];
    var response = await dio.get('');
    return residenceComplexes;
  }

  Future<List<ResidenceComplex>> getFilteredResidenceComplexes() async {
    List<ResidenceComplex> residenceComplexes = [];
    var response = await dio.get('');
    return residenceComplexes;
  }

}