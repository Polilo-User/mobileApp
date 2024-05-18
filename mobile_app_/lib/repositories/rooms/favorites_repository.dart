



import 'package:get_it/get_it.dart';

import 'db_favorites_rooms.dart';
import 'models/room.dart';

class FavoritesRepository {

  DBFavoritesRooms dbFavoritesRooms = GetIt.I<DBFavoritesRooms>();

  Future<List<Room>> getFavorites() async {
    return await dbFavoritesRooms.getFavorites();
  }

  Future<void> addToFavorites({required Room room}) async {
    await dbFavoritesRooms.insertFavorite(room);
  }

  Future<bool> isFavorite(int id) async {
    return await dbFavoritesRooms.isFavorite(id);
  }

}