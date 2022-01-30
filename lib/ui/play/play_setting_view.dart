import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_quiz/configs.dart';

class SettingViewModel with ChangeNotifier {
  String difficulty = '';
  int questionNum = 5;
  int correctNum = 0;
  int no = 1;
  int correct = 0;
  int ansIndex = 0;
  int correctIndex = 0;
  int errorNum = 0;
  bool reverse = false;
  bool endless = false;
  bool circle = false;
  bool cross = false;
  bool check = false;
  List<int> choise = [];

  void init() {
    difficulty = '';
    questionNum = 5;
    correctNum = 0;
    errorNum = 0;
    no = 1;
    reflesh();
  }

  void reflesh() {
    createQuiz();
    circle = false;
    cross = false;
    check = false;
    notify();
  }

  void createQuiz() {
    final tmp = <int>{};
    choise = [];
    final rand = math.Random();
    correct = rand.nextInt(textStyleList.length);
    tmp.add(correct);
    while (tmp.length < 4) {
      tmp.add(rand.nextInt(textStyleList.length));
    }
    choise = tmp.toList();
    for (var i = 3; i > 0; i--) {
      final n = rand.nextInt(i + 1);
      final temp = choise[i];
      choise[i] = choise[n];
      choise[n] = temp;
    }
    correctIndex = choise.indexOf(correct);
  }

  void notify() => notifyListeners();
}
