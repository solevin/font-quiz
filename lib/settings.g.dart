// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      databaseName: json['database_name'] as String,
      databaseVersion: json['database_version'] as int,
      createTableSQL: (json['create_table_sql'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      insertRecordSQL: (json['insert_record_sql'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isInitDatabase: json['is_init_database'] as bool,
      isShowDatabaseViewer: json['is_show_database_viewer'] as bool,
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'database_name': instance.databaseName,
      'database_version': instance.databaseVersion,
      'create_table_sql': instance.createTableSQL,
      'insert_record_sql': instance.insertRecordSQL,
      'is_init_database': instance.isInitDatabase,
      'is_show_database_viewer': instance.isShowDatabaseViewer,
    };
