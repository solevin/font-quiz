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
    return Scaffold(
      body: Consumer<SettingViewModel>(
        builder: (context, model, _) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                            fontSize: 20.sp,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Text(
                      '${fontFamilyToDisplayName[textStyleList[model.correct].fontFamily]}',
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
                          maxLines: 1,
                          cursorColor: textColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'SAMPLE',
                          ),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: textColor,
                            fontFamily: textStyleList[model.correct].fontFamily,
                          ),
                        ),
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
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Center(
                            child: Text(
                              '${fontFamilyToDisplayName[textStyleList[model.choise[0]].fontFamily]}',
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          ansCheck(model.choise[0], context, model);
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
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Center(
                            child: Text(
                              '${fontFamilyToDisplayName[textStyleList[model.choise[1]].fontFamily]}',
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          ansCheck(model.choise[1], context, model);
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
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Center(
                            child: Text(
                              '${fontFamilyToDisplayName[textStyleList[model.choise[2]].fontFamily]}',
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          ansCheck(model.choise[2], context, model);
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
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Center(
                            child: Text(
                              '${fontFamilyToDisplayName[textStyleList[model.choise[3]].fontFamily]}',
                              style: TextStyle(
                                fontSize: 25.sp,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          ansCheck(model.choise[3], context, model);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Visibility(
                  visible: model.circle,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: 200.w,
                        child: Image.asset('assets/true.jpeg'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SizedBox(
                          height: 40.h,
                          width: 200.w,
                          child: GestureDetector(
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.green),
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
                            onTap: () {
                              if (model.no >= model.questionNum) {
                                context.go('/result');
                              }
                              model.correctNum++;
                              model.no++;
                              model.reflesh();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Visibility(
                  visible: model.cross,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200.h,
                        width: 200.w,
                        child: Image.asset('assets/false.jpeg'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.h),
                        child: SizedBox(
                          height: 40.h,
                          width: 200.w,
                          child: GestureDetector(
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.green),
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
                            onTap: () {
                              if (model.no >= model.questionNum) {
                                context.go('/result');
                              }
                              model.no++;
                              model.reflesh();
                            },
                          ),
                        ),
                      ),
                    ],
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

void ansCheck(int ans, BuildContext context, SettingViewModel model) {
  if (model.circle == false && model.cross == false) {
    if (ans == model.correct) {
      model.circle = true;
    } else {
      model.cross = true;
    }
    model.notify();
  }
}
