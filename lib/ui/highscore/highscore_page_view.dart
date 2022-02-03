import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/db/highscore.dart';
import 'package:font_quiz/db/highscore_dao.dart';

class HighscoreViewModel with ChangeNotifier {
  List<List<HiScore>> topFive = [];

  Future<void> init() async{
    topFive.clear();
    var tmp = await pickTop(0);
    topFive.add(tmp);
    tmp = await pickTop(1);
    topFive.add(tmp);
    tmp = await pickTop(2);
    topFive.add(tmp);
    notify();
  }

  Future<List<HiScore>> pickTop(int difficulty) async {
    final hiScoreDao = HiScoreDao();
    final rankList = await hiScoreDao.pickUpAll();
    var result = <HiScore>[];
    result += rankList[difficulty];
    if (rankList[difficulty].length < 5) {
      for (var i = 0; i < 5 - rankList[difficulty].length; i++) {
        final blank = HiScore(score: 0, date: '**-**-**');
        result.add(blank);
      }
    }
    return result;
  }

  void notify() => notifyListeners();
}
