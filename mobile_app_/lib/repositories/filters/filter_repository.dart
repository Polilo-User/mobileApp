

import 'package:flutter/material.dart';



abstract class FilterRepository {
   Map<String, RangeValues> valueMap = {};
   String GetValues();
   List<String> AllLeadTime = [ "Неважно", "Сдан", "III КВ. 2024", "IV КВ. 2024", "III КВ. 2025", "IV КВ. 2025", "IV КВ. 2026"];
   String? LeadTime = "Неважно";
}