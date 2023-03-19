import 'package:flutter_test/flutter_test.dart';

import 'package:font_quiz/db/font.dart';

void main() {
  group('Font', () {
    test('fromMap() should return Font instance from Map', () {
      // fromMap()メソッドに、適切なMapを渡したときに、
      // そのMapから正しいFontインスタンスが生成されることをテストする。
      final fontMap = <String, dynamic>{
        'id': 2, // fact
        'name': 'Roboto',
        'difficulty': 3,
        'is_favorite': 1,
      };
      final font = Font.fromMap(fontMap);

      expect(font.id, equals(1));
      expect(font.name, equals('Roboto'));
      expect(font.difficulty, equals(3));
      expect(font.isFavorite, isTrue);
    });

    test('toMap() should return Map from Font instance', () {
      // toMap()メソッドに、正しい値が設定されたFontインスタンスを渡したときに、
      // そのFontインスタンスから期待されるMapが生成されることをテストする。
      final font = Font(
        id: 2,
        name: 'Open Sans',
        difficulty: 2,
        isFavorite: false,
      );
      final fontMap = font.toMap();

      expect(fontMap['id'], equals(2));
      expect(fontMap['name'], equals('Open Sans'));
      expect(fontMap['difficulty'], equals(2));
      expect(fontMap['is_favorite'], equals(0));
    });

    test('toMapExceptId() should return Map without id from Font instance', () {
      // toMapExceptId()メソッドに、正しい値が設定されたFontインスタンスを渡したときに、
      // そのFontインスタンスから期待されるMap（idを除いたもの）が生成されることをテストする。
      final font = Font(
        id: 3,
        name: 'Montserrat',
        difficulty: 1,
        isFavorite: true,
      );
      final fontMap = font.toMapExceptId();

      expect(fontMap.containsKey('id'), isFalse);
      expect(fontMap['name'], equals('Montserrat'));
      expect(fontMap['difficulty'], equals(1));
      expect(fontMap['is_favorite'], equals(1));
    });
  });
}