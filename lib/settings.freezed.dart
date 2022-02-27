// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {@JsonKey(name: 'database_name')
          required String databaseName,
      @JsonKey(name: 'database_version')
          required int databaseVersion,
      @JsonKey(name: 'create_table_sql')
          required List<String> createTableSQL,
      @JsonKey(name: 'insert_record_sql')
          required List<String> insertRecordSQL,
      @JsonKey(name: 'is_init_database')
          required bool isInitDatabase,
      @JsonKey(name: 'is_show_database_viewer')
          required bool isShowDatabaseViewer}) {
    return _Settings(
      databaseName: databaseName,
      databaseVersion: databaseVersion,
      createTableSQL: createTableSQL,
      insertRecordSQL: insertRecordSQL,
      isInitDatabase: isInitDatabase,
      isShowDatabaseViewer: isShowDatabaseViewer,
    );
  }

  Settings fromJson(Map<String, Object?> json) {
    return Settings.fromJson(json);
  }
}

/// @nodoc
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  @JsonKey(name: 'database_name')
  String get databaseName => throw _privateConstructorUsedError;
  @JsonKey(name: 'database_version')
  int get databaseVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_table_sql')
  List<String> get createTableSQL => throw _privateConstructorUsedError;
  @JsonKey(name: 'insert_record_sql')
  List<String> get insertRecordSQL => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_init_database')
  bool get isInitDatabase => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_show_database_viewer')
  bool get isShowDatabaseViewer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'database_name') String databaseName,
      @JsonKey(name: 'database_version') int databaseVersion,
      @JsonKey(name: 'create_table_sql') List<String> createTableSQL,
      @JsonKey(name: 'insert_record_sql') List<String> insertRecordSQL,
      @JsonKey(name: 'is_init_database') bool isInitDatabase,
      @JsonKey(name: 'is_show_database_viewer') bool isShowDatabaseViewer});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? databaseName = freezed,
    Object? databaseVersion = freezed,
    Object? createTableSQL = freezed,
    Object? insertRecordSQL = freezed,
    Object? isInitDatabase = freezed,
    Object? isShowDatabaseViewer = freezed,
  }) {
    return _then(_value.copyWith(
      databaseName: databaseName == freezed
          ? _value.databaseName
          : databaseName // ignore: cast_nullable_to_non_nullable
              as String,
      databaseVersion: databaseVersion == freezed
          ? _value.databaseVersion
          : databaseVersion // ignore: cast_nullable_to_non_nullable
              as int,
      createTableSQL: createTableSQL == freezed
          ? _value.createTableSQL
          : createTableSQL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      insertRecordSQL: insertRecordSQL == freezed
          ? _value.insertRecordSQL
          : insertRecordSQL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInitDatabase: isInitDatabase == freezed
          ? _value.isInitDatabase
          : isInitDatabase // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowDatabaseViewer: isShowDatabaseViewer == freezed
          ? _value.isShowDatabaseViewer
          : isShowDatabaseViewer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'database_name') String databaseName,
      @JsonKey(name: 'database_version') int databaseVersion,
      @JsonKey(name: 'create_table_sql') List<String> createTableSQL,
      @JsonKey(name: 'insert_record_sql') List<String> insertRecordSQL,
      @JsonKey(name: 'is_init_database') bool isInitDatabase,
      @JsonKey(name: 'is_show_database_viewer') bool isShowDatabaseViewer});
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object? databaseName = freezed,
    Object? databaseVersion = freezed,
    Object? createTableSQL = freezed,
    Object? insertRecordSQL = freezed,
    Object? isInitDatabase = freezed,
    Object? isShowDatabaseViewer = freezed,
  }) {
    return _then(_Settings(
      databaseName: databaseName == freezed
          ? _value.databaseName
          : databaseName // ignore: cast_nullable_to_non_nullable
              as String,
      databaseVersion: databaseVersion == freezed
          ? _value.databaseVersion
          : databaseVersion // ignore: cast_nullable_to_non_nullable
              as int,
      createTableSQL: createTableSQL == freezed
          ? _value.createTableSQL
          : createTableSQL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      insertRecordSQL: insertRecordSQL == freezed
          ? _value.insertRecordSQL
          : insertRecordSQL // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInitDatabase: isInitDatabase == freezed
          ? _value.isInitDatabase
          : isInitDatabase // ignore: cast_nullable_to_non_nullable
              as bool,
      isShowDatabaseViewer: isShowDatabaseViewer == freezed
          ? _value.isShowDatabaseViewer
          : isShowDatabaseViewer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  const _$_Settings(
      {@JsonKey(name: 'database_name')
          required this.databaseName,
      @JsonKey(name: 'database_version')
          required this.databaseVersion,
      @JsonKey(name: 'create_table_sql')
          required this.createTableSQL,
      @JsonKey(name: 'insert_record_sql')
          required this.insertRecordSQL,
      @JsonKey(name: 'is_init_database')
          required this.isInitDatabase,
      @JsonKey(name: 'is_show_database_viewer')
          required this.isShowDatabaseViewer});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  @JsonKey(name: 'database_name')
  final String databaseName;
  @override
  @JsonKey(name: 'database_version')
  final int databaseVersion;
  @override
  @JsonKey(name: 'create_table_sql')
  final List<String> createTableSQL;
  @override
  @JsonKey(name: 'insert_record_sql')
  final List<String> insertRecordSQL;
  @override
  @JsonKey(name: 'is_init_database')
  final bool isInitDatabase;
  @override
  @JsonKey(name: 'is_show_database_viewer')
  final bool isShowDatabaseViewer;

  @override
  String toString() {
    return 'Settings(databaseName: $databaseName, databaseVersion: $databaseVersion, createTableSQL: $createTableSQL, insertRecordSQL: $insertRecordSQL, isInitDatabase: $isInitDatabase, isShowDatabaseViewer: $isShowDatabaseViewer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Settings &&
            const DeepCollectionEquality()
                .equals(other.databaseName, databaseName) &&
            const DeepCollectionEquality()
                .equals(other.databaseVersion, databaseVersion) &&
            const DeepCollectionEquality()
                .equals(other.createTableSQL, createTableSQL) &&
            const DeepCollectionEquality()
                .equals(other.insertRecordSQL, insertRecordSQL) &&
            const DeepCollectionEquality()
                .equals(other.isInitDatabase, isInitDatabase) &&
            const DeepCollectionEquality()
                .equals(other.isShowDatabaseViewer, isShowDatabaseViewer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(databaseName),
      const DeepCollectionEquality().hash(databaseVersion),
      const DeepCollectionEquality().hash(createTableSQL),
      const DeepCollectionEquality().hash(insertRecordSQL),
      const DeepCollectionEquality().hash(isInitDatabase),
      const DeepCollectionEquality().hash(isShowDatabaseViewer));

  @JsonKey(ignore: true)
  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(this);
  }
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {@JsonKey(name: 'database_name')
          required String databaseName,
      @JsonKey(name: 'database_version')
          required int databaseVersion,
      @JsonKey(name: 'create_table_sql')
          required List<String> createTableSQL,
      @JsonKey(name: 'insert_record_sql')
          required List<String> insertRecordSQL,
      @JsonKey(name: 'is_init_database')
          required bool isInitDatabase,
      @JsonKey(name: 'is_show_database_viewer')
          required bool isShowDatabaseViewer}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  @JsonKey(name: 'database_name')
  String get databaseName;
  @override
  @JsonKey(name: 'database_version')
  int get databaseVersion;
  @override
  @JsonKey(name: 'create_table_sql')
  List<String> get createTableSQL;
  @override
  @JsonKey(name: 'insert_record_sql')
  List<String> get insertRecordSQL;
  @override
  @JsonKey(name: 'is_init_database')
  bool get isInitDatabase;
  @override
  @JsonKey(name: 'is_show_database_viewer')
  bool get isShowDatabaseViewer;
  @override
  @JsonKey(ignore: true)
  _$SettingsCopyWith<_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
