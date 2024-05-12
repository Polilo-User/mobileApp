


import 'package:flutter/material.dart';
import 'filter_repository.dart';

class ProjectFilterRepository extends FilterRepository {

  ProjectFilterRepository();

  // "Сдан"
  List<String> AllLeadTime = [ "Неважно", "III КВ. 2024", "IV КВ. 2024", "III КВ. 2025", "IV КВ. 2025", "IV КВ. 2026"];
  String? LeadTime = "Неважно";

   @override
  Map<String, RangeValues> valueMap = {
    'coast':  const RangeValues(6, 13),
   };

  @override
  String GetValues() {
    return "стоимость ${valueMap['coast'] as RangeValues}";
  }

}