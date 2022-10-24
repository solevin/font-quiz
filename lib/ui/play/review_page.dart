import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xFF5C4444);
    final wrongList = context.read<SettingViewModel>().wrongList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('REVIEW'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 450.h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeWidgets(wrongList),
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
                onTap: () async {
                  context.go('/result');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeWidgets(List<int> wrongList) {
  final contentWidgets = <Widget>[];
  for (var i = 0; i < wrongList.length; i++) {
    contentWidgets.add(bodyContent(wrongList[i]));
  }
  return contentWidgets;
}

Widget bodyContent(int font) {
  const textColor = Color(0xFF5C4444);
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.all(8.h),
        child: Text(
          '${fontFamilyToDisplayName[textStyleList[font].fontFamily]}',
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
              ),
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w800,
                color: textColor,
                fontFamily: textStyleList[font].fontFamily,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
