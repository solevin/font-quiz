import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReversePage extends StatelessWidget {
  const ReversePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF5C4444);
    return Scaffold(
      body: Consumer<SettingViewModel>(
        builder: (context, model, _) {
          return Column(
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
                  '${model.correct}',
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
                    padding: EdgeInsets.all(8.h),
                    child: SizedBox(
                      height: 40.h,
                      width: 40.w,
                      child: GestureDetector(
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.orange),
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
                          maxLines: 1,
                          cursorColor: textColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'SAMPLE',
                          ),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: textColor,
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
                          decoration: BoxDecoration(color: Colors.orange),
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
                          maxLines: 1,
                          cursorColor: textColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'SAMPLE',
                          ),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: textColor,
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
                          decoration: BoxDecoration(color: Colors.orange),
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
                          maxLines: 1,
                          cursorColor: textColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'SAMPLE',
                          ),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: textColor,
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
                          decoration: BoxDecoration(color: Colors.orange),
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
                          maxLines: 1,
                          cursorColor: textColor,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 20.w,
                            ),
                            border: const OutlineInputBorder(),
                            labelText: 'SAMPLE',
                          ),
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w800,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

void ansCheck(int ans, BuildContext context, SettingViewModel model) {
  if (ans == model.correct) {
    print('true');
    model.correctNum++;
  } else {
    print('false');
  }
  model.no++;
  if (model.no > model.questionNum) {
    // Navigator.pushNamedAndRemoveUntil(context, '/result', (route) => false);
    // Navigator.pushNamed(context, '/result');
    context.go('/result');
  }
  model.reflesh();
}
