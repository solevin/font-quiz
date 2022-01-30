import 'package:font_quiz/db/db_provider.dart';
import 'package:font_quiz/db/highscore.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HiScoreDao {
  final DBProvider _dbProvider = DBProvider();
  final _tbName = DBProvider.tableName;

  Future<List<HiScore>> findAll() async {
    final db = await _dbProvider.database;
    final result = await db.query(_tbName);
    final scores = List.generate(result.length, (i) {
      return HiScore.fromMap(result[i]);
    });
    return scores;
  }

  Future<List<List<HiScore>>> pickUpAll() async {
    final pickedList = <List<HiScore>>[];
    var tmpList = await pickUp('Easy');
    pickedList.add(tmpList);
    tmpList = await pickUp('Normal');
    pickedList.add(tmpList);
    tmpList = await pickUp('Hard');
    pickedList.add(tmpList);
    return pickedList;
  }

  Future<List<HiScore>> pickUp(String difficulty) async {
    final db = await _dbProvider.database;
    final result = await db.rawQuery(
        'SELECT * FROM $_tbName WHERE difficulty = ? ORDER BY score desc',
        [difficulty]);
    final picks = List.generate(result.length, (i) {
      return HiScore.fromMap(result[i]);
    });
    return picks;
  }

  Future<int> create(HiScore hiScore) async {
    final db = await _dbProvider.database;
    final result = await db.insert(_tbName, hiScore.toMapExceptId());
    return result;
  }

  // update
  Future<int> update(int id, HiScore hiScore) async {
    final db = await _dbProvider.database;
    final result = await db.update(
      _tbName,
      hiScore.toMapExceptId(),
      where: 'id=?',
      whereArgs: [id],
    );
    return result;
  }

  // delete
  Future<void> deleteAll() async {
    final db = await _dbProvider.database;
    await db.delete(
      _tbName,
    );
  }

  Future<void> deleteElement(int id) async {
    final db = await _dbProvider.database;
    await db.delete(_tbName, where: 'id=?', whereArgs: [id]);
  }

  Future<void> deleteDB() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'myDatabase.db');
    await deleteDatabase(path);
  }
}
