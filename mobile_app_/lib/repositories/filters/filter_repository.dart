

import 'package:flutter/material.dart';



abstract class IFilterRepository {
   Map<String, RangeValues> valueMap = {};
   String GetValues();
   List<bool> rooms = [true, true, true, true, true, true];
}