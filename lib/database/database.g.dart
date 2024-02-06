// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharacterItemsTable extends CharacterItems
    with TableInfo<$CharacterItemsTable, CharacterItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_items';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
    );
  }

  @override
  $CharacterItemsTable createAlias(String alias) {
    return $CharacterItemsTable(attachedDatabase, alias);
  }
}

class CharacterItem extends DataClass implements Insertable<CharacterItem> {
  final int id;
  final String name;
  final String subCategory;
  const CharacterItem(
      {required this.id, required this.name, required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  CharacterItemsCompanion toCompanion(bool nullToAbsent) {
    return CharacterItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory CharacterItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  CharacterItem copyWith({int? id, String? name, String? subCategory}) =>
      CharacterItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class CharacterItemsCompanion extends UpdateCompanion<CharacterItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  const CharacterItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  CharacterItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<CharacterItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  CharacterItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? subCategory}) {
    return CharacterItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }
}

class $ArmorItemsTable extends ArmorItems
    with TableInfo<$ArmorItemsTable, ArmorItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArmorItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'armor_items';
  @override
  VerificationContext validateIntegrity(Insertable<ArmorItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArmorItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArmorItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
    );
  }

  @override
  $ArmorItemsTable createAlias(String alias) {
    return $ArmorItemsTable(attachedDatabase, alias);
  }
}

class ArmorItem extends DataClass implements Insertable<ArmorItem> {
  final int id;
  final String name;
  final String subCategory;
  const ArmorItem(
      {required this.id, required this.name, required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  ArmorItemsCompanion toCompanion(bool nullToAbsent) {
    return ArmorItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory ArmorItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArmorItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  ArmorItem copyWith({int? id, String? name, String? subCategory}) => ArmorItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  @override
  String toString() {
    return (StringBuffer('ArmorItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArmorItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class ArmorItemsCompanion extends UpdateCompanion<ArmorItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  const ArmorItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  ArmorItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<ArmorItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  ArmorItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? subCategory}) {
    return ArmorItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmorItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }
}

class $AccessoryItemsTable extends AccessoryItems
    with TableInfo<$AccessoryItemsTable, AccessoryItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccessoryItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accessory_items';
  @override
  VerificationContext validateIntegrity(Insertable<AccessoryItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccessoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccessoryItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
    );
  }

  @override
  $AccessoryItemsTable createAlias(String alias) {
    return $AccessoryItemsTable(attachedDatabase, alias);
  }
}

class AccessoryItem extends DataClass implements Insertable<AccessoryItem> {
  final int id;
  final String name;
  final String subCategory;
  const AccessoryItem(
      {required this.id, required this.name, required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  AccessoryItemsCompanion toCompanion(bool nullToAbsent) {
    return AccessoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory AccessoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccessoryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  AccessoryItem copyWith({int? id, String? name, String? subCategory}) =>
      AccessoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  @override
  String toString() {
    return (StringBuffer('AccessoryItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccessoryItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class AccessoryItemsCompanion extends UpdateCompanion<AccessoryItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  const AccessoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  AccessoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<AccessoryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  AccessoryItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? subCategory}) {
    return AccessoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }
}

abstract class _$ItemDatabase extends GeneratedDatabase {
  _$ItemDatabase(QueryExecutor e) : super(e);
  late final $CharacterItemsTable characterItems = $CharacterItemsTable(this);
  late final $ArmorItemsTable armorItems = $ArmorItemsTable(this);
  late final $AccessoryItemsTable accessoryItems = $AccessoryItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [characterItems, armorItems, accessoryItems];
}

class $UserFavoriteItemsTable extends UserFavoriteItems
    with TableInfo<$UserFavoriteItemsTable, UserFavoriteItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFavoriteItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumn<String> subCategory = GeneratedColumn<String>(
      'sub_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_favorite_items';
  @override
  VerificationContext validateIntegrity(Insertable<UserFavoriteItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('sub_category')) {
      context.handle(
          _subCategoryMeta,
          subCategory.isAcceptableOrUnknown(
              data['sub_category']!, _subCategoryMeta));
    } else if (isInserting) {
      context.missing(_subCategoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFavoriteItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFavoriteItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
    );
  }

  @override
  $UserFavoriteItemsTable createAlias(String alias) {
    return $UserFavoriteItemsTable(attachedDatabase, alias);
  }
}

class UserFavoriteItem extends DataClass
    implements Insertable<UserFavoriteItem> {
  final int id;
  final String name;
  final String subCategory;
  const UserFavoriteItem(
      {required this.id, required this.name, required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  UserFavoriteItemsCompanion toCompanion(bool nullToAbsent) {
    return UserFavoriteItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory UserFavoriteItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFavoriteItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  UserFavoriteItem copyWith({int? id, String? name, String? subCategory}) =>
      UserFavoriteItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  @override
  String toString() {
    return (StringBuffer('UserFavoriteItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class UserFavoriteItemsCompanion extends UpdateCompanion<UserFavoriteItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  const UserFavoriteItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  UserFavoriteItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<UserFavoriteItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  UserFavoriteItemsCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? subCategory}) {
    return UserFavoriteItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (subCategory.present) {
      map['sub_category'] = Variable<String>(subCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFavoriteItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }
}

class $UserFavoriteCharactersTable extends UserFavoriteCharacters
    with TableInfo<$UserFavoriteCharactersTable, UserFavoriteCharacter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFavoriteCharactersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _characterInfoMeta =
      const VerificationMeta('characterInfo');
  @override
  late final GeneratedColumn<String> characterInfo = GeneratedColumn<String>(
      'character_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, characterInfo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_favorite_characters';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserFavoriteCharacter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('character_info')) {
      context.handle(
          _characterInfoMeta,
          characterInfo.isAcceptableOrUnknown(
              data['character_info']!, _characterInfoMeta));
    } else if (isInserting) {
      context.missing(_characterInfoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserFavoriteCharacter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFavoriteCharacter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      characterInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_info'])!,
    );
  }

  @override
  $UserFavoriteCharactersTable createAlias(String alias) {
    return $UserFavoriteCharactersTable(attachedDatabase, alias);
  }
}

class UserFavoriteCharacter extends DataClass
    implements Insertable<UserFavoriteCharacter> {
  final int id;
  final String characterInfo;
  const UserFavoriteCharacter({required this.id, required this.characterInfo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_info'] = Variable<String>(characterInfo);
    return map;
  }

  UserFavoriteCharactersCompanion toCompanion(bool nullToAbsent) {
    return UserFavoriteCharactersCompanion(
      id: Value(id),
      characterInfo: Value(characterInfo),
    );
  }

  factory UserFavoriteCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFavoriteCharacter(
      id: serializer.fromJson<int>(json['id']),
      characterInfo: serializer.fromJson<String>(json['characterInfo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterInfo': serializer.toJson<String>(characterInfo),
    };
  }

  UserFavoriteCharacter copyWith({int? id, String? characterInfo}) =>
      UserFavoriteCharacter(
        id: id ?? this.id,
        characterInfo: characterInfo ?? this.characterInfo,
      );
  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharacter(')
          ..write('id: $id, ')
          ..write('characterInfo: $characterInfo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterInfo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteCharacter &&
          other.id == this.id &&
          other.characterInfo == this.characterInfo);
}

class UserFavoriteCharactersCompanion
    extends UpdateCompanion<UserFavoriteCharacter> {
  final Value<int> id;
  final Value<String> characterInfo;
  const UserFavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.characterInfo = const Value.absent(),
  });
  UserFavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String characterInfo,
  }) : characterInfo = Value(characterInfo);
  static Insertable<UserFavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? characterInfo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterInfo != null) 'character_info': characterInfo,
    });
  }

  UserFavoriteCharactersCompanion copyWith(
      {Value<int>? id, Value<String>? characterInfo}) {
    return UserFavoriteCharactersCompanion(
      id: id ?? this.id,
      characterInfo: characterInfo ?? this.characterInfo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterInfo.present) {
      map['character_info'] = Variable<String>(characterInfo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharactersCompanion(')
          ..write('id: $id, ')
          ..write('characterInfo: $characterInfo')
          ..write(')'))
        .toString();
  }
}

abstract class _$UserFavoriteDataBase extends GeneratedDatabase {
  _$UserFavoriteDataBase(QueryExecutor e) : super(e);
  late final $UserFavoriteItemsTable userFavoriteItems =
      $UserFavoriteItemsTable(this);
  late final $UserFavoriteCharactersTable userFavoriteCharacters =
      $UserFavoriteCharactersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userFavoriteItems, userFavoriteCharacters];
}
