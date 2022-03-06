import 'package:font_quiz/constants.dart';
import 'package:font_quiz/db/db_provider.dart';
import 'package:font_quiz/db/font.dart';

class FontDao {
  final DBProvider _dbProvider = DBProvider();

  Future<List<Font>> findAll() async {
    final db = await _dbProvider.database;
    final result = await db!.query(tableNameFonts);
    final fonts = List.generate(result.length, (i) {
      return Font.fromMap(result[i]);
    });
    return fonts;
  }

  Future<Font> findById(int id) async {
    final db = await _dbProvider.database;
    final result =
        await db!.query(tableNameFonts, where: 'id=?', whereArgs: [id]);
    final font = Font.fromMap(result[0]);
    return font;
  }

  Future<List<int>> findByDifficulty(int difficulty) async {
    final db = await _dbProvider.database;
    final result = await db!
        .query(tableNameFonts, where: 'difficulty=?', whereArgs: [difficulty]);
    var eachDifficultyList = <int>[];
    for(var i = 0;i< result.length;i++){
      eachDifficultyList.add(result[i]['id'] as int);
    }
    return eachDifficultyList;
  }

  Future<int> update(int id, Font font) async {
    final db = await _dbProvider.database;
    final result = await db!.update(
      tableNameFonts,
      font.toMapExceptId(),
      where: 'id=?',
      whereArgs: [id],
    );
    return result;
  }
}
