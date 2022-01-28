import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF5C4444);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESULT'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(12.h),
            child: Text(
              '難易度 : ${context.read<SettingViewModel>().difficulty}',
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
                '正解数 : ${context.read<SettingViewModel>().correctNum} / ${context.read<SettingViewModel>().questionNum}',
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
              width: 100.w,
              child: GestureDetector(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
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
                  context.read<SettingViewModel>().init();
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/playSetting', (route) => false);
                  context.go('/playSetting');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
