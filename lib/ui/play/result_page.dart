import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/db/highscore.dart';
import 'package:font_quiz/db/highscore_dao.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF5C4444);
    final modeText =
        context.read<SettingViewModel>().endless ? 'エンドレスモード' : 'トレーニングモード';
    final result = context.read<SettingViewModel>().endless
        ? '${context.read<SettingViewModel>().correctNum}'
        : '${context.read<SettingViewModel>().correctNum} / ${context.read<SettingViewModel>().questionNum}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULT'),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<SettingViewModel>(
        builder: (context, model, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(12.h),
                child: Text(
                  modeText,
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: textColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.h),
                child: Text(
                  '難易度 : ${model.difficulty}',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: textColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Center(
                  child: Text(
                    '正解数 : $result',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: SizedBox(
                  height: 40.h,
                  width: 170.w,
                  child: GestureDetector(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.orange),
                      child: Center(
                        child: Text(
                          'REVIEW',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async{
                      context.go('/review');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: SizedBox(
                  height: 40.h,
                  width: 100.w,
                  child: GestureDetector(
                    child: DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.orange),
                      child: Center(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    onTap: () async{
                      if (model.endless == true) {
                        final now = DateTime.now();
                        final outputFormat = DateFormat('yyyy-MM-dd');
                        final date = outputFormat.format(now);
                        final hiScoreDao = HiScoreDao();
                        final hiScore = HiScore(
                          difficulty: model.difficulty,
                          score: model.correctNum,
                          date: date,
                        );
                        await hiScoreDao.create(hiScore);
                      }
                      model.init();
                      // ignore: use_build_context_synchronously
                      context.go('/playSetting');
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
