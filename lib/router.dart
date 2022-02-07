import 'package:font_quiz/ui/highscore/highscore_page.dart';
import 'package:font_quiz/ui/home/home_page.dart';
import 'package:font_quiz/ui/play/play_page.dart';
import 'package:font_quiz/ui/play/play_page_reverse.dart';
import 'package:font_quiz/ui/play/play_setting_page.dart';
import 'package:font_quiz/ui/play/result_page.dart';
import 'package:font_quiz/ui/play/review_page.dart';
import 'package:font_quiz/ui/view/view_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomePage(),
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
      name: 'review',
      path: '/review',
      builder: (context, state) => const ReviewPage(),
    ),
    GoRoute(
      name: 'view',
      path: '/view',
      builder: (context, state) => const ViewPage(),
    ),
    GoRoute(
      name: 'setting',
      path: '/setting',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'hiScore',
      path: '/highScore',
      builder: (context, state) => const HighscorePage(),
    ),
  ]
);
