




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

  static Map<String, int> toNormalNumbers = {
    "I": 1,
    "II": 2,
    "III": 3,
    "IV": 4
  };

  static Map<int, String> toRimNumbers = {
    1: "I",
    2: "II",
    3: "III",
    4: "IV"
  };


// "Неважно", "III КВ. 2024", "IV КВ. 2024", "III КВ. 2025", "IV КВ. 2025", "IV КВ. 2026"
  Future<Map<String, dynamic>> getFilterOptions(String leadTime) async {

    if (leadTime == "Неважно") {
      return {
        "filters": {
          "priceFrom": filter.valueMap['coast']!.start.toInt(),
          "priceTo": filter.valueMap['coast']!.end.toInt(),
        }
      };
    }

    List<String> parts = leadTime.split(" ");
    int? quarter = toNormalNumbers[parts[0]];
    int year = int.parse(parts[2]);

    return {
      "filters": {
        "priceFrom": filter.valueMap['coast']!.start.toInt(),
        "priceTo": filter.valueMap['coast']!.end.toInt(),
        "year": year,
        "cvartal": quarter
      }
    };
  }

  Future<List<ResidenceComplex>> getFilteredResidenceComplexes() async {

    Map<String, dynamic> filterOptions = await getFilterOptions(filter.LeadTime!);

    var response = await dio.post(
        'http://185.104.114.7:8095/buildings/getBuildingsByFilter',
        data: json.encode(filterOptions),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
    );

    List<ResidenceComplex> residenceComplexData = [];

    final data = response.data as Map<String, dynamic>;

    data['data'].forEach((element) {
      final name = element['name'] as String;
      final imgUrl = element['imgUrl'] as String;
      final lowestPrice = element['price'] as int;
      final filterLeadTime = element['year'] + " " + toRimNumbers[int.parse(element['cvartal'])];//  +  as String;
      residenceComplexData.add(ResidenceComplex(
          name: name,
          imgUrl: imgUrl,
          lowestPrice: lowestPrice,
          leadTime: filterLeadTime
      ));
    });

    return residenceComplexData;
  }

}