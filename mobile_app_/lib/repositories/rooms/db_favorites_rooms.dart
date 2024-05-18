



import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mobile_app_/repositories/rooms/room.dart';


class DBFavoritesRooms {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  // наша бдшка
  late Database _database;

  // обычный конструктор
  DBFavoritesRooms._private() {
    _initDatabase();
  }

  // sigma ассинхронный конструктор
  static Future<DBFavoritesRooms> create() async {
    final instance = DBFavoritesRooms._private();
    instance._database = await instance._initDatabase();
    return instance;
  }

  _initDatabase() async {
    // путь к бдшке делаем
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/$_databaseName"; // join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // sql отработает как только бахнем бд
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE if not exists favorites (
        id		serial primary key,
        name varchar,
        price int,
        building_id int,
        area int,
        floor int,
        countofrooms int
      );
      ''');
  }

  // получаем все помещения из избранного
  Future<List<Room>> getFavorites() async {
    final result = await _database.rawQuery('SELECT * FROM "favorites"');
    return result.map((row) => Room(
      Id: row['id'] as int,
      Name: row['name'] as String,
      Price: row['price'] as int,
      BuildingId: row['building_id'] as int,
      Area: row['area'] as int,
      Floor: row['floor'] as int,
      CountOfRooms: row['countofrooms'] as int,
    )).toList();
  }

  // удалить из избранного
  Future<void> deleteFavorite(Room room) async {
    await _database.delete(
      'favorites',
      where: 'name = ?',
      whereArgs: [room.Name],
    );
  }

  // проверка на избанное
  Future<bool> isFavorite(int id) async {
    final result = await _database.query(
      'favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty;
  }


  // добавляем помещение в избранное
  Future<Room> insertFavorite(Room room) async {

    // проверка на уникальность помещения
    final result = await _database.query(
      'favorites',
      where: 'name = ?',
      whereArgs: [room.Name],
    );
    if (result.isNotEmpty) {
      // уже есть в избранном -> удалить
      await deleteFavorite(room);
      return room;
    }

    await _database.insert(
      'favorites',
      room.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return room;
  }

}