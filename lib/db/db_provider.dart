import 'package:font_quiz/db/highscore.dart';
import 'package:font_quiz/db/highscore_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  factory DBProvider() => _instance;
  DBProvider._internal();
  static final DBProvider _instance = DBProvider._internal();

  static const String _databaseName = 'myDatabase.db';
  static const int _databaseVersion = 1;
  static const String tableName = 'highScore';

  static const bool initMode = false;

  Database? _database;

  Future<Database?> get database async {
    if (_database != null && !initMode) {
      // final path = join(await getDatabasesPath(), _databaseName);
      // return _database = await openDatabase(
      //   path,
      //   version: _databaseVersion,
      // );
      return _database;
    } else {
      final difficultyList = ['Easy', 'Normal', 'Hard'];
      final hiScoreDao = HiScoreDao();

      _database = await initDB();

      for (var i = 0; i < 3; i++) {
        final hiScore = HiScore(
          difficulty: difficultyList[i],
          score: 0,
          date: '**-**-**',
        );
        await hiScoreDao.create(hiScore);
      }

      return _database;
    }
  }

  Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), _databaseName);

    if (initMode) {
      await deleteDatabase(path);
    }

    final data = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) {
        // await _createTable(db, version);
        return db.execute('''
      CREATE TABLE $tableName
      (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        difficulty TEXT NOT NULL,
        score INTEGER NOT NULL,
        date TEXT NOT NULL
      )
    ''');
      },
    );

    return data;
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
