import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test!', () {
    expect(() {
      assert(false);
    }, throwsA(isA<AssertionError>()));
  });
}