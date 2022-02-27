import 'package:flutter/material.dart';
import 'package:font_quiz/settings.dart';
import 'package:font_quiz/setttings_provider.dart';
import 'package:font_quiz/ui/highscore/highscore_page.dart';
import 'package:font_quiz/ui/home/home_page.dart';
import 'package:font_quiz/ui/play/play_page.dart';
import 'package:font_quiz/ui/play/play_page_reverse.dart';
import 'package:font_quiz/ui/play/play_setting_page.dart';
import 'package:font_quiz/ui/play/result_page.dart';
import 'package:font_quiz/ui/view/view_page.dart';
import 'package:go_router/go_router.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      // builder: (context, state) => const HomePage(),
      builder: (context, state) {
        final settingsProvider = SettingsProvider();
        return FutureBuilder(
          future: settingsProvider.settings,
          builder: (BuildContext context, AsyncSnapshot<Settings?> snapshot) {
            final settings = snapshot.data;
            if (snapshot.hasData) {
              return HomePage(settings: settings!);
            } else {
              return const Text('Now Loading...');
            }
          }
        );
      },
    ),
    GoRoute(
      name: 'play',
      path: '/play',
      builder: (context, state) => const PlayPage(),
    ),
    GoRoute(
      name: 'playSetting',
      path: '/playSetting',
      builder: (context, state) => const SettingPage(),
    ),
    GoRoute(
      name: 'reverse',
      path: '/reverse',
      builder: (context, state) => const ReversePage(),
    ),
    GoRoute(
      name: 'result',
      path: '/result',
      builder: (context, state) => const ResultPage(),
    ),
    GoRoute(
      name: 'view',
      path: '/view',
      builder: (context, state) => const ViewPage(),
    ),
    GoRoute(
      name: 'setting',
      path: '/setting',
      builder: (context, state) => const DatabaseList(),
    ),
    GoRoute(
      name: 'hiScore',
      path: '/highScore',
      builder: (context, state) => const HighscorePage(),
    ),
    GoRoute(
      name: '_db',
      path: '/_db',
      builder: (context, state) => const DatabaseList(),
    ),
  ]
);
