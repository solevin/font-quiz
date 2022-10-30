import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

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
                                exitConditon(model),
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10.w),
                          child: Center(
                            child: SizedBox(
                              width: 335.w,
                              child: TextField(
                                cursorColor: textColor,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                    left: 20.w,
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'SAMPLE',
                                  // hintText: displayNameToTextStyle[
                                  //         model.choice[model.correctIndex]]!
                                  //     .fontFamily,
                                  // hintText: textStyleMurecho.fontFamily,
                                ),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: textColor,
                                  fontFamily: displayNameToTextStyle[
                                          model.choice[model.correctIndex]]!
                                      .fontFamily,
                                  // fontFamily: 'SawarabiGothic_regular',
                                  // fontFamily: textStyleMurecho.fontFamily,
                                ),
                              ),
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
                          child: Image.asset('assets/images/image_true.jpeg'),
                        ),
                      ),
                    ),
                    Center(
                      child: Visibility(
                        visible: model.cross,
                        child: SizedBox(
                          height:200.h,
                          child: Image.asset('assets/images/image_false.jpeg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    height: 40.h,
                    width: 300.w,
                    child: GestureDetector(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: changeColor(0, model),
                        ),
                        child: Center(
                          child: Text(
                            model.choice[0],
                            style: TextStyle(
                              fontSize: 25.sp,
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
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    height: 40.h,
                    width: 300.w,
                    child: GestureDetector(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: changeColor(1, model),
                        ),
                        child: Center(
                          child: Text(
                            model.choice[1],
                            style: TextStyle(
                              fontSize: 25.sp,
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
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    height: 40.h,
                    width: 300.w,
                    child: GestureDetector(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: changeColor(2, model),
                        ),
                        child: Center(
                          child: Text(
                            model.choice[2],
                            style: TextStyle(
                              fontSize: 25.sp,
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
                  padding: EdgeInsets.all(8.h),
                  child: SizedBox(
                    height: 40.h,
                    width: 300.w,
                    child: GestureDetector(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: changeColor(3, model),
                        ),
                        child: Center(
                          child: Text(
                            model.choice[3],
                            style: TextStyle(
                              fontSize: 25.sp,
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
                nextQuestion(context, model),
              ],
            );
          },
        ),
      ),
    );
  }
}

void ansCheck(int ans, BuildContext context, SettingViewModel model) {
  if (model.circle == false && model.cross == false) {
    if (ans == model.correctIndex) {
      model.circle = true;
      // AudioPlayer().play('assets/sound/correct.mp3');
      AudioCache().play('sound/correct.mp3');
      // context.read<SoundViewModel>().sound('correct');
      model.correctNum++;
    } else {
      model.cross = true;
      AudioCache().play('sound/incorrect.mp3');
      // context.read<SoundViewModel>().sound('incorrect');
      model.wrongList.add(ans);
      model.errorNum++;
    }
    model
      ..check = true
      ..notify();
  }
}

Color changeColor(int index, SettingViewModel model) {
  if (model.check == true) {
    if (index == model.ansIndex) {
      if (model.ansIndex == model.correctIndex) {
        return Colors.yellow;
      } else {
        return Colors.blue;
      }
    } else if (index == model.correctIndex) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  } else {
    return Colors.orange;
  }
}

Widget nextQuestion(BuildContext context, SettingViewModel model) {
  const textColor = Color(0xFF5C4444);
  if (model.check == true) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: SizedBox(
        height: 40.h,
        width: 200.w,
        child: GestureDetector(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.green),
            child: Center(
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: textColor,
                ),
              ),
            ),
          ),
          onTap: () {
            if (model.endless == true) {
              if (model.errorNum >= 3) {
                context.go('/result');
              }
            } else {
              if (model.no >= model.questionNum) {
                context.go('/result');
              }
            }
            model.no++;
            model.refresh();
          },
        ),
      ),
    );
  } else {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: SizedBox(
        height: 40.h,
        width: 200.w,
      ),
    );
  }
}

String exitConditon(SettingViewModel model) {
  if (model.endless == true) {
    return 'x' * model.errorNum + ' ' * (2 - model.errorNum);
  } else {
    return '${model.correctNum} / ${model.questionNum}';
  }
}
