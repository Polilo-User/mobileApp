import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteDbRepository {
static final GetIt _locator = GetIt.instance;

static void setup() {
_locator.registerLazySingleton(() => FavoriteDbRepository());
}

static FavoriteDbRepository get instance => _locator<FavoriteDbRepository>();

Database _database;

Future<Database> get database async {
if (_database != null) {
return _database;
}
_database = await _initDb();
return _database;
}

Future<Database> _initDb() async {
String databasesPath = await getDatabasesPath();
String path = join(databasesPath, 'favorites.db');

    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE favorites (id INTEGER PRIMARY KEY)');
    });
}

Future<void> addFavorite(int apartmentId) async {
final Database db = await database;
await db.insert('favorites', {'id': apartmentId}, conflictAlgorithm: ConflictAlgorithm.ignore);
}

Future<void> removeFavorite(int apartmentId) async {
final Database db = await database;
await db.delete('favorites', where: 'id = ?', whereArgs: [apartmentId]);
}

Future<List<int>> getFavorites() async {
final Database db = await database;
final List<Map<String, dynamic>> maps = await db.query('favorites');
return List.generate(maps.length, (i) {
return maps[i]['id'];
});
}
}
