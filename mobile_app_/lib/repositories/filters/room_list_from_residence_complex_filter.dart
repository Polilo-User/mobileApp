



import 'package:flutter/material.dart';
import 'room_filter_repository.dart';

class RoomListFromResidenceComplexFilter extends RoomFilterRepository {
  RoomListFromResidenceComplexFilter(): super() {
    // Количество комнат
    rooms = [true, true, true, true, true, true];

    // Слайдеры
    valueMap = {
      'coast':  const RangeValues(6, 13),
      'square': const RangeValues(37, 93),
      'floor':  const RangeValues(2, 16),
    };
  }
}