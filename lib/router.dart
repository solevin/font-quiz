import 'package:font_quiz/ui/home/home_page.dart';
import 'package:font_quiz/ui/play/play_page.dart';
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
      name: 'view',
      path: '/view',
      builder: (context, state) => const ViewPage(),
    ),
    GoRoute(
      name: 'setting',
      path: '/setting',
      builder: (context, state) => const HomePage(),
    ),
  ]
);
