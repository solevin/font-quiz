import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    @JsonKey(name: 'database_name') required String databaseName,
    @JsonKey(name: 'database_version') required int databaseVersion,
    @JsonKey(name: 'create_table_sql') required List<String> createTableSQL,
    @JsonKey(name: 'insert_record_sql') required List<String> insertRecordSQL,
    @JsonKey(name: 'is_init_database') required bool isInitDatabase,
    @JsonKey(name: 'is_show_database_viewer') 
        required bool isShowDatabaseViewer,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
