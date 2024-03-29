

import 'package:flutter/material.dart';
import 'filter_repository.dart';
// запомним в оперативной памяти фильтр помещений
class RoomFilterRepository extends FilterRepository {

  RoomFilterRepository();


  // Количество комнат по умолчанию
  List<bool> _rooms = [false, false, false, false, false, false];

  // Количество комнат
  List<bool> rooms = [false, false, false, false, false, false];



  // Слайдеры по умолчанию
  Map<String, RangeValues> _valueMap = {
    'coast':  const RangeValues(6, 13),
    'square': const RangeValues(37, 93),
    'floor':  const RangeValues(2, 16),
  };

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