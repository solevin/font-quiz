import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_quiz/db/font.dart';
import 'package:font_quiz/db/font_dao.dart';
import 'package:font_quiz/db/question.dart';
import 'package:font_quiz/db/question_dao.dart';
import 'package:font_quiz/configs.dart';

class SettingViewModel with ChangeNotifier {
  String difficulty = '';
  int questionNum = 5;
  int correctNum = 0;
  int no = 1;
  String correct = '';
  int ansIndex = 0;
  int correctIndex = 0;
  int errorNum = 0;
  bool reverse = false;
  bool endless = false;
  bool circle = false;
  bool cross = false;
  bool check = false;
  List<String> choice = [];
  List<int> wrongList = [];
  List<int> ansIdList = [];

  final questionDao = QuestionDao();
  final fontDao = FontDao();

  void init() {
    endless = false;
    reverse = false;
    questionNum = 5;
    difficulty = 'Normal';
  }

  Future<void> start() async {
    ansIdList.clear();
    var index = 0;
    correctNum = 0;
    errorNum = 0;
    no = 1;
    wrongList.clear();
    ansIdList.clear();
    switch (difficulty) {
      case 'Easy':
        index = 1;
        break;
      case 'Normal':
        index = 2;
        break;
      case 'Hard':
        index = 3;
        break;
    }
    final futureAnsIdList = await fontDao.findByDifficulty(index);
    ansIdList.addAll(futureAnsIdList);
    await refresh();
  }

  Future<void> refresh() async{
    await createQuiz();
    circle = false;
    cross = false;
    check = false;
    notify();
  }

  Future<void> createQuiz() async {
    choice.clear();
    final rand = math.Random();
    var questionList = <Question>[];
    final correctId = ansIdList[rand.nextInt(ansIdList.length)];
    questionList = await questionDao.findByAnswerId(correctId);
    var futureFont = await fontDao.findById(correctId);
    correct = futureFont.name;
    // choice = List.generate(questionList.length, (i) {
    //   return questionList[i].toMap()['selection_id'] as int;
    // });
    for (var i = 0; i < questionList.length; i++) {
      futureFont = await fontDao.findById(questionList[i].selectionId);
      choice.add(futureFont.name);
    }
    for (var i = choice.length - 1; i > 0; i--) {
      final n = rand.nextInt(i + 1);
      final temp = choice[i];
      choice[i] = choice[n];
      choice[n] = temp;
    }
    if (choice.length > 4) {
      final tmp = [choice[0],choice[1],choice[2],choice[3]];
      choice = tmp;
    }
    correctIndex = choice.indexOf(correct);
    if(correctIndex < 0){
      await createQuiz();
    }
  }

  void notify() => notifyListeners();
}
