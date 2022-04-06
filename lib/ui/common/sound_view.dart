import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SoundViewModel with ChangeNotifier {
  bool active = true;


  void sound(String name){
    AudioCache()
      .play('$name.mp3');
  }

  void notify() => notifyListeners();
}
