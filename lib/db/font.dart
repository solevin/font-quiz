class Font {

  Font({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.isFavorite
  });

  Font.fromMap(Map<String, dynamic> paramMap)
      : id = paramMap['id'] as int,
        name = paramMap['name'] as String,
        difficulty = paramMap['difficulty'] as int,
        isFavorite = paramMap['is_favorite'] == 1;

  final int id;
  final String name;
  final int difficulty;
  final bool isFavorite;

  Map<String, dynamic> toMap() => <String, dynamic>{
      'id': id,
      'name': name,
      'difficulty': difficulty,
      'is_favorite': isFavorite ? 1 : 0,
    };

  Map<String, dynamic> toMapExceptId() {
    final cloneMap = <String, dynamic>{...toMap()}..remove('id');
    return cloneMap;
  }

}
