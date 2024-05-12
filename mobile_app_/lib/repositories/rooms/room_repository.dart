





import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/repositories/filters/filter.dart';
import 'package:mobile_app_/repositories/rooms/room.dart';

import 'dart:convert';


class RoomRepository extends AbstractRoomRepository {

  final RoomFilterRepository filter = GetIt.I<RoomFilterRepository>();
  Dio dio;

  RoomRepository({required this.dio});




  // Area         int64 `json:"area"`
  // CountOfRooms int64 `json:"rooms"`
  // Floor        int64 `json:"floor"`

  Future<List<Room>> getFilteredRooms() async {

    var response = await dio.post(
      'http://185.104.114.7:8095/apartaments/getApartByFilter',
      data: json.encode(
          {
            "filters": {
              "priceFrom": filter.valueMap['coast']!.start.toInt(),
              "priceTo": filter.valueMap['coast']!.end.toInt(),
            }
          }),
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    List<Room> rooms = [];

    final data = response.data as Map<String, dynamic>;

    data['data'].forEach( (element) {

      final id = element['id'] as int;
      final name = element['name'] as String;
      final price = element['price'] as int;
      final building_id = element['building_id'] as int;

      final area = element['area'] as int;
      final floor = element['floor'] as int;
      final count_of_rooms = element['countOfRooms'] as int;

      var isAdd = true;

      // Area filter
      if ( !(filter.valueMap['square']!.start <= area && filter.valueMap['square']!.end >= area) ){
        isAdd = false;
      }

      // Floor filter
      if ( !(filter.valueMap['floor']!.start <= floor && filter.valueMap['floor']!.end >= floor) ){
        isAdd = false;
      }

      // Count of rooms filter
      //                  студия  1      2      3      4      5+
      // List<bool> rooms [false, false, false, false, false, false]
      // Никто не занет что такое студия и существуют ли студии
      if (count_of_rooms >= 5) {
        if (!filter.rooms[5]) {
          isAdd = false;
        }
      } else {
        if (!filter.rooms[count_of_rooms]) {
          isAdd = false;
        }
      }

      if (isAdd) {
        rooms.add(Room(
          Id: id,
          Name: name,
          Price: price,
          Area: area,
          Floor: floor,
          CountOfRooms: count_of_rooms,
          BuildingId: building_id
        ));
      }
    });

    return rooms;
  }

  @override
  Future<List<Room>> getRooms() async {
    List<Room> rooms = [];
    return rooms;
  }

}