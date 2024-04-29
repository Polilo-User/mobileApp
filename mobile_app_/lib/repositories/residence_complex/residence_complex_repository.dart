




import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import './models/residence_complex.dart';
import 'package:mobile_app_/repositories/filters/progect_filters.dart';

import 'dart:convert';

class ResidenceComplexRepository {

  final ProjectFilterRepository filter = GetIt.I<ProjectFilterRepository>();

  Dio dio;

  ResidenceComplexRepository({required this.dio});


  Future<List<ResidenceComplex>> getFilteredResidenceComplexes() async {

    Map<String, dynamic> FilterOptions = {
      "cvartal": 1, // filter.LeadTime
      "year": 2024,
      "priceFrom": filter.valueMap['coast']!.start.toInt(),
      "priceTo": filter.valueMap['coast']!.end.toInt(),
    };

    var response = await dio.post(
        'http://185.104.114.7:8095/buildings/getBuildingsByFilter',
        data: json.encode(FilterOptions),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
    );

    List<ResidenceComplex> residenceComplexData = [];

    final data = response.data as Map<String, dynamic>;
    data['data'].forEach((element) {
      final name = element['name'] as String;
      final imgUrl = element['imgUrl'] as String;
      residenceComplexData.add(ResidenceComplex(name: name, imgUrl: imgUrl));
    });

    return residenceComplexData;
  }

}