import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/highscore/highscore_page_view.dart';
import 'package:provider/provider.dart';

class HighscorePage extends StatelessWidget {
  const HighscorePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final read = context.read<HighscoreViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('HighScore'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            displayRank('Easy', read),
            displayRank('Normal', read),
            displayRank('Hard', read),
          ],
        ));
  }
}

Widget displayRank(String difficulty, HighscoreViewModel read) {
  const textColor = Color(0xFF5C4444);
  var index = 0;
  switch (difficulty) {
    case 'Easy':
      index = 0;
      break;
    case 'Normal':
      index = 1;
      break;
    case 'Hard':
      index = 2;
      break;
  }
  final scoreList = read.topFive[index];
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Text(
          difficulty,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '1st : ',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '${scoreList[0].score} ${scoreList[0].date}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '2nd : ',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '${scoreList[0].score} ${scoreList[0].date}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '3rd : ',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '${scoreList[0].score} ${scoreList[0].date}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4th : ',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '${scoreList[0].score} ${scoreList[0].date}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '5th : ',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            Text(
              '${scoreList[0].score} ${scoreList[0].date}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
