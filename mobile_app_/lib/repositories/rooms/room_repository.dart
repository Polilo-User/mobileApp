




import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app_/repositories/filters/filter.dart';
import 'package:mobile_app_/repositories/rooms/room.dart';


class RoomRepository extends AbstractRoomRepository {

  final RoomFilterRepository filter = GetIt.I<RoomFilterRepository>();
  Dio dio;

  RoomRepository({required this.dio});


  @override
  Future<List<Room>> getRooms() async {
    List<Room> rooms = [];
    var response = await dio.get('');
    return rooms;
  }

  Future<List<Room>> getFilteredRooms() async {
    List<Room> rooms = [];
    var response = await dio.get('');
    return rooms;
  }

}