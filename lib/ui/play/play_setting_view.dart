import 'dart:math' as math;
import 'package:flutter/material.dart';

class SettingViewModel with ChangeNotifier {
  String difficulty = '';
  int questionNum = 5;
  int correctNum = 0;
  int no = 1;
  int correct = 0;
  bool mode = false;
  bool circle = false;
  bool cross = false;

  void init() {
  difficulty = '';
  questionNum = 5;
  correctNum = 0;
  no = 1;
    reflesh();
  }

  void reflesh(){
    final rand = math.Random();
    correct = rand.nextInt(4);
    circle = false;
    cross = false;
    notify();
  }

  void notify() => notifyListeners();
}
