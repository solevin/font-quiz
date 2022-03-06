import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/settings.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';
import 'package:font_quiz/ui/highscore/highscore_page_view.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.settings}) : super(key: key);

  final Settings settings;

  @override
  Widget build(BuildContext context) {
    context.read<HighscoreViewModel>().init();
    return Scaffold(
      appBar: AppTitleBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            MenuItem(
              text: 'Play',
              route: '/playSetting',
            ),
            MenuItem(
              text: 'View',
              route: '/view',
            ),
            MenuItem(
              text: 'Setting',
              route: '/',
            ),
            MenuItem(
              text: 'HighScore',
              route: '/highScore',
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
      floatingActionButton:
        settings.isShowDatabaseViewer
        ?
          FloatingActionButton(
            onPressed: () {
              context.go('/_db');
            },
          )
        :
          null,
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
        if(text == 'Play'){
          context.read<SettingViewModel>();
        }
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
