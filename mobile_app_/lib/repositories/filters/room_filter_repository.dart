

import 'package:flutter/material.dart';
import 'filter_repository.dart';
// запомним в оперативной памяти фильтр помещений
class RoomFilterRepository extends FilterRepository {

  RoomFilterRepository();


  // Количество комнат
  List<bool> rooms = [true, true, true, true, true, true];

  // Слайдеры
  @override
  Map<String, RangeValues> valueMap = {
    'coast':  const RangeValues(6, 13),
    'square': const RangeValues(37, 93),
    'floor':  const RangeValues(2, 16),
  };

  @override
  String GetValues() {
    return "$rooms, стоимость ${valueMap['coast'] as RangeValues}, площадь ${valueMap['square'] as RangeValues}, этаж ${valueMap['floor'] as RangeValues}";
  }

}