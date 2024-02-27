


import 'package:flutter/material.dart';
import 'filter_repository.dart';

class ProjectFilterRepository extends FilterRepository {

  ProjectFilterRepository();

   Map<String, RangeValues> valueMap = {
    'coast':  RangeValues(6, 13),
   };

  @override
  String GetValues() {
    return "стоимость ${valueMap['coast'] as RangeValues}";
  }

}