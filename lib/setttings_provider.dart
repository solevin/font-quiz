import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:font_quiz/settings.dart';

import 'gen/assets.gen.dart';

class SettingsProvider {
  factory SettingsProvider() => _instance;
  SettingsProvider._internal();
  static final SettingsProvider _instance = SettingsProvider._internal();

  Settings? _settings;

  Future<Settings> get settings async {
    if (_settings != null) {
      return _settings!;
    } else {
      return _settings = await loadSettings();
    }
  }

  Future<Settings> loadSettings() async {
    final settingsString = await rootBundle.loadString(Assets.json.settings);
    final settingsMap = json.decode(settingsString) as Map<String, dynamic>;
    return Settings.fromJson(settingsMap);
  }

}
