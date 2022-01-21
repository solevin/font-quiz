import 'package:flutter/material.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(),
      body: const Text('play'),
    );
  }
}
