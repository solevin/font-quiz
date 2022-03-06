import 'package:font_quiz/constants.dart';
import 'package:font_quiz/db/db_provider.dart';
import 'package:font_quiz/db/question.dart';

class QuestionDao {
  final DBProvider _dbProvider = DBProvider();

  Future<List<Question>> findAll() async {
    final db = await _dbProvider.database;
    final result = await db!.query(tableNameQuestions);
    final questions = List.generate(result.length, (i) {
      return Question.fromMap(result[i]);
    });
    return questions;
  }

  Future<List<Question>> findByAnswerId(int answerId) async {
    final db = await _dbProvider.database;
    final result = await db!
        .query(tableNameQuestions, where: 'answer_id=?', whereArgs: [answerId]);
    final questions = List.generate(result.length, (i) {
      return Question.fromMap(result[i]);
    });
    return questions;
  }
}
