import 'dart:convert' show json;

import 'package:flutter/services.dart';
import 'package:font_quiz/gen/assets.gen.dart';
import 'package:font_quiz/settings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  factory DBProvider() => _instance;
  DBProvider._internal();
  static final DBProvider _instance = DBProvider._internal();

  Future<Settings> get _settings async {
    final settingsString = await rootBundle.loadString(Assets.json.settings);
    final settingsMap = json.decode(settingsString) as Map<String, dynamic>;
    return Settings.fromJson(settingsMap);
  }

  Database? _database;

  Future<Database?> get database async {
    final settings = await _settings;
    if (_database != null && !settings.isInitDatabase) {
      return _database;
    } else {
      return _database = await initDB();
    }
  }

  Future<Database> initDB() async {
    final settings = await _settings;
    final path = join(
      await getDatabasesPath(),
      settings.databaseName,
    );

    if (settings.isInitDatabase) {
      await deleteDatabase(path);
    }

    return openDatabase(
      path,
      version: settings.databaseVersion,
      onCreate: _initTable,
    );
  }

  Future<void> _initTable(Database database, int version) async {
    final settings = await _settings;
    for (final sql in settings.createTableSQL) {
      await database.execute(sql);
    }
    for (final sql in settings.insertRecordSQL) {
      await database.execute(sql);
    }
  }
}
