

import 'package:flutter/material.dart';
import 'filter_repository.dart';
// запомним в оперативной памяти фильтр помещений
class RoomFilterRepository extends FilterRepository {

  RoomFilterRepository();

  // Количество комнат
  List<bool> rooms = [false, false, false, false, false, false];
  
  // Слайдеры
  Map<String, RangeValues> valueMap = {
    'coast':  RangeValues(6, 13),
    'square': RangeValues(37, 93),
    'floor':  RangeValues(2, 16),
  };

  String GetValues() {
    return "${rooms}, стоимость ${valueMap['coast'] as RangeValues}, площадь ${valueMap['square'] as RangeValues}, этаж ${valueMap['floor'] as RangeValues}";
  }

}