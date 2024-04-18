




import './models/room.dart';

abstract class AbstractRoomRepository {
  Future<List<Room>> getRooms();
}