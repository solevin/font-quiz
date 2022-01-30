import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  factory DBProvider() => _instance;
  DBProvider._internal();
  static final DBProvider _instance = DBProvider._internal();

  static const String _databaseName = 'myDatabase.db';
  static const int _databaseVersion = 1;
  static const String tableName = 'highScore';

  static const bool initMode = true;

  late Database _database;

  Future<Database> get database async {
    if (!initMode) {
      return _database;
    } else {
      return _database = await initDB();
      // return _database;
    }
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), _databaseName);

    if (initMode) {
      await deleteDatabase(path);
    }

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (Database database, int version) async {
        await _createTable(database, version);
      },
    );
  }

  Future<void> _createTable(Database database, int version) async {
    return database.execute('''
      CREATE TABLE $tableName
      (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        difficulty TEXT NOT NULL,
        score INTEGER NOT NULL,
        date TEXT NOT NULL
      )
    ''');
  }
}
