import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/ui/play/play_page.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:provider/provider.dart';

class ReversePage extends StatelessWidget {
  const ReversePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF5C4444);
    final modeText =
        context.read<SettingViewModel>().endless ? 'エンドレスモード' : 'トレーニングモード';
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Consumer<SettingViewModel>(
          builder: (context, model, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Column(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12.h),
                              child: Text(
                                '第${model.no}問',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12.h),
                              child: Text(
                                '${model.correctNum} / ${model.questionNum}',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.h),
                          child: Text(
                            model.choice[model.correctIndex],
                            style: TextStyle(
                              fontSize: 30.sp,
                              color: textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Visibility(
                        visible: model.circle,
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: Image.asset('assets/true.jpeg'),
                        ),
                      ),
                    ),
                    Center(
                      child: Visibility(
                        visible: model.cross,
                        child: SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: Image.asset('assets/false.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: GestureDetector(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: changeColor(0, model),
                            ),
                            child: Center(
                              child: Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            model.ansIndex = 0;
                            ansCheck(0, context, model);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
                      child: Center(
                        child: SizedBox(
                          width: 250.w,
                          child: TextField(
                            cursorColor: textColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: model.choice[0],
                              // hintText: 'SAMPLE',
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontFamily:
                                  displayNameToTextStyle[model.choice[0]]!
                                      .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: GestureDetector(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: changeColor(1, model),
                            ),
                            child: Center(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            model.ansIndex = 1;
                            ansCheck(1, context, model);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
                      child: Center(
                        child: SizedBox(
                          width: 250.w,
                          child: TextField(
                            cursorColor: textColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              border: const OutlineInputBorder(),
                              // hintText: 'SAMPLE',
                              hintText: model.choice[1],
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontFamily:
                                  displayNameToTextStyle[model.choice[1]]!
                                      .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: GestureDetector(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: changeColor(2, model),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            model.ansIndex = 2;
                            ansCheck(2, context, model);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
                      child: Center(
                        child: SizedBox(
                          width: 250.w,
                          child: TextField(
                            cursorColor: textColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              border: const OutlineInputBorder(),
                              // hintText: 'SAMPLE',
                              hintText: model.choice[2],
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontFamily:
                                  displayNameToTextStyle[model.choice[2]]!
                                      .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        height: 40.h,
                        width: 40.w,
                        child: GestureDetector(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: changeColor(3, model),
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            model.ansIndex = 3;
                            ansCheck(3, context, model);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
                      child: Center(
                        child: SizedBox(
                          width: 250.w,
                          child: TextField(
                            cursorColor: textColor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                left: 20.w,
                              ),
                              border: const OutlineInputBorder(),
                              // hintText: 'SAMPLE',
                              hintText: model.choice[3],
                            ),
                            style: TextStyle(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: textColor,
                              fontFamily:
                                  displayNameToTextStyle[model.choice[3]]!
                                      .fontFamily,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                nextQuestion(context, model),
              ],
            );
          },
        ),
      ),
    );
  }
}
