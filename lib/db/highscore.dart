import 'dart:convert';
import 'dart:typed_data';

class HiScore {
  HiScore({
    this.id,
    this.difficulty,
    this.score,
    this.date,
  });

  HiScore.fromMap(Map<String, dynamic> paramMap)
      : id = paramMap['id'] as int,
        difficulty = paramMap['difficulty'] as String,
        score = paramMap['score'] as int,
        date = paramMap['date'] as String;

  int? id;
  String? difficulty;
  int? score;
  String? date;

  Map<String, dynamic> toMap() => <String, dynamic>{
        if (id != null) 'id': id,
        if (difficulty != null) 'difficulty': difficulty,
        if (score != null) 'score': score,
        if (date != null) 'date': date,
      };

  Map<String, dynamic> toMapExceptId() {
    final cloneMap = <String, dynamic>{...toMap()}..remove('id');
    return cloneMap;
  }
}
