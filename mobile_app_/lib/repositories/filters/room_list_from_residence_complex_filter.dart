



import 'package:flutter/material.dart';
import 'filter_repository.dart';
import 'room_filter_repository.dart';

class RoomListFromResidenceComplexFilter extends FilterRepository {

  // Количество комнат
  List<bool> rooms = [true, true, true, true, true, true];

  // Слайдеры
  @override
  Map<String, RangeValues> valueMap = {
    'coast':  const RangeValues(6, 13),
    'square': const RangeValues(37, 93),
    'floor':  const RangeValues(2, 16),
  };


  void reset() {
    // Количество комнат
    rooms = [true, true, true, true, true, true];
    // Слайдеры
    valueMap = {
      'coast':  const RangeValues(6, 13),
      'square': const RangeValues(37, 93),
      'floor':  const RangeValues(2, 16),
    };
  }

  RoomListFromResidenceComplexFilter();

  @override
  String GetValues() {
    // TODO: implement GetValues
    throw UnimplementedError();
  }
}