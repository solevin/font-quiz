import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            MenuItem(
              text: 'Play',
              route: '/play',
            ),
            MenuItem(
              text: 'View',
              route: '/view',
            ),
            MenuItem(
              text: 'Setting',
              route: '/',
            ),
          ],
        ),
        // Center(
        //   child: Text(ï
        //     "Sample さんぷる",
        //     style: TEXT_STYLE_NOTO_SERIF,
        //   ),
        // ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key, 
    required this.text,
    required this.route,
  }) : super(key: key);

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go(route);
      },
      child: Container(
        width: 250.w,
        height: 70.h,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
        ),
      )
    );
  }
}
