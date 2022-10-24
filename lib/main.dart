import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/router.dart';
import 'package:font_quiz/ui/common/sound_view.dart';
import 'package:font_quiz/ui/highscore/highscore_page_view.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart' as provider;

void main() {
  runApp(
    ProviderScope(
      child: provider.MultiProvider(
        providers: [
          provider.ChangeNotifierProvider(
            create: (_) => SettingViewModel(),
          ),
          provider.ChangeNotifierProvider(
            create: (_) => HighscoreViewModel(),
          ),
          provider.ChangeNotifierProvider(
            create: (_) => SoundViewModel(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

const materialWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      // child: LayoutBuilder(
      // builder: (_, BoxConstraints constraints) {
      builder: (context, child) {
        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: 'Fonts Quiz',
          theme: ThemeData(
            primarySwatch: materialWhite,
          ),
          darkTheme: ThemeData.dark(),
          builder: (context, widget) {
            // ScreenUtil.init(
            //   constraints,
            //   designSize: const Size(360, 690),
            // );
            return widget!;
          },
        );
      },
    );

    // },
    //   ),
    // )
  }
}
