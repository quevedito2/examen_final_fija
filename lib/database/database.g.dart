// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PosteoData extends DataClass implements Insertable<PosteoData> {
  final int id;
  final int userId;
  final String title;
  final String Body;
  PosteoData(
      {required this.id,
      required this.userId,
      required this.title,
      required this.Body});
  factory PosteoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PosteoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}userId'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      Body: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['userId'] = Variable<int>(userId);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(Body);
    return map;
  }

  PosteoCompanion toCompanion(bool nullToAbsent) {
    return PosteoCompanion(
      id: Value(id),
      userId: Value(userId),
      title: Value(title),
      Body: Value(Body),
    );
  }

  factory PosteoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PosteoData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      title: serializer.fromJson<String>(json['title']),
      Body: serializer.fromJson<String>(json['Body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'title': serializer.toJson<String>(title),
      'Body': serializer.toJson<String>(Body),
    };
  }

  PosteoData copyWith({int? id, int? userId, String? title, String? Body}) =>
      PosteoData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        title: title ?? this.title,
        Body: Body ?? this.Body,
      );
  @override
  String toString() {
    return (StringBuffer('PosteoData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('Body: $Body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, title, Body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PosteoData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.title == this.title &&
          other.Body == this.Body);
}

class PosteoCompanion extends UpdateCompanion<PosteoData> {
  final Value<int> id;
  final Value<int> userId;
  final Value<String> title;
  final Value<String> Body;
  const PosteoCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.title = const Value.absent(),
    this.Body = const Value.absent(),
  });
  PosteoCompanion.insert({
    required int id,
    required int userId,
    required String title,
    required String Body,
  })  : id = Value(id),
        userId = Value(userId),
        title = Value(title),
        Body = Value(Body);
  static Insertable<PosteoData> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<String>? title,
    Expression<String>? Body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      if (title != null) 'title': title,
      if (Body != null) 'body': Body,
    });
  }

  PosteoCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<String>? title,
      Value<String>? Body}) {
    return PosteoCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      Body: Body ?? this.Body,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['userId'] = Variable<int>(userId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (Body.present) {
      map['body'] = Variable<String>(Body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosteoCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('title: $title, ')
          ..write('Body: $Body')
          ..write(')'))
        .toString();
  }
}

class $PosteoTable extends Posteo with TableInfo<$PosteoTable, PosteoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PosteoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int?> userId = GeneratedColumn<int?>(
      'userId', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _BodyMeta = const VerificationMeta('Body');
  @override
  late final GeneratedColumn<String?> Body = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, userId, title, Body];
  @override
  String get aliasedName => _alias ?? 'posteo';
  @override
  String get actualTableName => 'posteo';
  @override
  VerificationContext validateIntegrity(Insertable<PosteoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('userId')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['userId']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
          _BodyMeta, Body.isAcceptableOrUnknown(data['body']!, _BodyMeta));
    } else if (isInserting) {
      context.missing(_BodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PosteoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PosteoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PosteoTable createAlias(String alias) {
    return $PosteoTable(attachedDatabase, alias);
  }
}

abstract class _$AppDataBases extends GeneratedDatabase {
  _$AppDataBases(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PosteoTable posteo = $PosteoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posteo];
}
