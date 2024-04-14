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
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory, gender];
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
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
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
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
  final int gender;
  const CharacterItem(
      {required this.id,
      required this.name,
      required this.subCategory,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    return map;
  }

  CharacterItemsCompanion toCompanion(bool nullToAbsent) {
    return CharacterItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
    );
  }

  factory CharacterItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
    };
  }

  CharacterItem copyWith(
          {int? id, String? name, String? subCategory, int? gender}) =>
      CharacterItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender);
}

class CharacterItemsCompanion extends UpdateCompanion<CharacterItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  const CharacterItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
  });
  CharacterItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<CharacterItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
    });
  }

  CharacterItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender}) {
    return CharacterItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
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
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
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
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, subCategory, gender];
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
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
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
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
  final int gender;
  const ArmorItem(
      {required this.id,
      required this.name,
      required this.subCategory,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    return map;
  }

  ArmorItemsCompanion toCompanion(bool nullToAbsent) {
    return ArmorItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
    );
  }

  factory ArmorItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArmorItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
    };
  }

  ArmorItem copyWith(
          {int? id, String? name, String? subCategory, int? gender}) =>
      ArmorItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('ArmorItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, subCategory, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArmorItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender);
}

class ArmorItemsCompanion extends UpdateCompanion<ArmorItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  const ArmorItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
  });
  ArmorItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<ArmorItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
    });
  }

  ArmorItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender}) {
    return ArmorItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
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
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmorItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
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
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int> gender = GeneratedColumn<int>(
      'gender', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isFullFaceCoverMeta =
      const VerificationMeta('isFullFaceCover');
  @override
  late final GeneratedColumn<bool> isFullFaceCover = GeneratedColumn<bool>(
      'is_full_face_cover', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_full_face_cover" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, subCategory, gender, isFullFaceCover];
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
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('is_full_face_cover')) {
      context.handle(
          _isFullFaceCoverMeta,
          isFullFaceCover.isAcceptableOrUnknown(
              data['is_full_face_cover']!, _isFullFaceCoverMeta));
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
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      isFullFaceCover: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_full_face_cover']),
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
  final int gender;
  final bool? isFullFaceCover;
  const AccessoryItem(
      {required this.id,
      required this.name,
      required this.subCategory,
      required this.gender,
      this.isFullFaceCover});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    if (!nullToAbsent || isFullFaceCover != null) {
      map['is_full_face_cover'] = Variable<bool>(isFullFaceCover);
    }
    return map;
  }

  AccessoryItemsCompanion toCompanion(bool nullToAbsent) {
    return AccessoryItemsCompanion(
      id: Value(id),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
      isFullFaceCover: isFullFaceCover == null && nullToAbsent
          ? const Value.absent()
          : Value(isFullFaceCover),
    );
  }

  factory AccessoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccessoryItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
      isFullFaceCover: serializer.fromJson<bool?>(json['isFullFaceCover']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
      'isFullFaceCover': serializer.toJson<bool?>(isFullFaceCover),
    };
  }

  AccessoryItem copyWith(
          {int? id,
          String? name,
          String? subCategory,
          int? gender,
          Value<bool?> isFullFaceCover = const Value.absent()}) =>
      AccessoryItem(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
        isFullFaceCover: isFullFaceCover.present
            ? isFullFaceCover.value
            : this.isFullFaceCover,
      );
  @override
  String toString() {
    return (StringBuffer('AccessoryItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender, ')
          ..write('isFullFaceCover: $isFullFaceCover')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, subCategory, gender, isFullFaceCover);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccessoryItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender &&
          other.isFullFaceCover == this.isFullFaceCover);
}

class AccessoryItemsCompanion extends UpdateCompanion<AccessoryItem> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  final Value<bool?> isFullFaceCover;
  const AccessoryItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
    this.isFullFaceCover = const Value.absent(),
  });
  AccessoryItemsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
    this.isFullFaceCover = const Value.absent(),
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<AccessoryItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
    Expression<bool>? isFullFaceCover,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
      if (isFullFaceCover != null) 'is_full_face_cover': isFullFaceCover,
    });
  }

  AccessoryItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender,
      Value<bool?>? isFullFaceCover}) {
    return AccessoryItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
      isFullFaceCover: isFullFaceCover ?? this.isFullFaceCover,
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
    if (gender.present) {
      map['gender'] = Variable<int>(gender.value);
    }
    if (isFullFaceCover.present) {
      map['is_full_face_cover'] = Variable<bool>(isFullFaceCover.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessoryItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender, ')
          ..write('isFullFaceCover: $isFullFaceCover')
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
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  @override
  late final GeneratedColumn<int> itemid = GeneratedColumn<int>(
      'itemid', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [id, itemid, name, subCategory];
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
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid']!, _itemidMeta));
    } else if (isInserting) {
      context.missing(_itemidMeta);
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
      itemid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itemid'])!,
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
  final int itemid;
  final String name;
  final String subCategory;
  const UserFavoriteItem(
      {required this.id,
      required this.itemid,
      required this.name,
      required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['itemid'] = Variable<int>(itemid);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  UserFavoriteItemsCompanion toCompanion(bool nullToAbsent) {
    return UserFavoriteItemsCompanion(
      id: Value(id),
      itemid: Value(itemid),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory UserFavoriteItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFavoriteItem(
      id: serializer.fromJson<int>(json['id']),
      itemid: serializer.fromJson<int>(json['itemid']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemid': serializer.toJson<int>(itemid),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  UserFavoriteItem copyWith(
          {int? id, int? itemid, String? name, String? subCategory}) =>
      UserFavoriteItem(
        id: id ?? this.id,
        itemid: itemid ?? this.itemid,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  @override
  String toString() {
    return (StringBuffer('UserFavoriteItem(')
          ..write('id: $id, ')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemid, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteItem &&
          other.id == this.id &&
          other.itemid == this.itemid &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class UserFavoriteItemsCompanion extends UpdateCompanion<UserFavoriteItem> {
  final Value<int> id;
  final Value<int> itemid;
  final Value<String> name;
  final Value<String> subCategory;
  const UserFavoriteItemsCompanion({
    this.id = const Value.absent(),
    this.itemid = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  UserFavoriteItemsCompanion.insert({
    this.id = const Value.absent(),
    required int itemid,
    required String name,
    required String subCategory,
  })  : itemid = Value(itemid),
        name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<UserFavoriteItem> custom({
    Expression<int>? id,
    Expression<int>? itemid,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemid != null) 'itemid': itemid,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  UserFavoriteItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemid,
      Value<String>? name,
      Value<String>? subCategory}) {
    return UserFavoriteItemsCompanion(
      id: id ?? this.id,
      itemid: itemid ?? this.itemid,
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
    if (itemid.present) {
      map['itemid'] = Variable<int>(itemid.value);
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
          ..write('itemid: $itemid, ')
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
  static const VerificationMeta _characterDataMeta =
      const VerificationMeta('characterData');
  @override
  late final GeneratedColumn<String> characterData = GeneratedColumn<String>(
      'character_data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterNameMeta =
      const VerificationMeta('characterName');
  @override
  late final GeneratedColumn<String> characterName = GeneratedColumn<String>(
      'character_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, characterData, characterName];
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
    if (data.containsKey('character_data')) {
      context.handle(
          _characterDataMeta,
          characterData.isAcceptableOrUnknown(
              data['character_data']!, _characterDataMeta));
    } else if (isInserting) {
      context.missing(_characterDataMeta);
    }
    if (data.containsKey('character_name')) {
      context.handle(
          _characterNameMeta,
          characterName.isAcceptableOrUnknown(
              data['character_name']!, _characterNameMeta));
    } else if (isInserting) {
      context.missing(_characterNameMeta);
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
      characterData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_data'])!,
      characterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_name'])!,
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
  final String characterData;
  final String characterName;
  const UserFavoriteCharacter(
      {required this.id,
      required this.characterData,
      required this.characterName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_data'] = Variable<String>(characterData);
    map['character_name'] = Variable<String>(characterName);
    return map;
  }

  UserFavoriteCharactersCompanion toCompanion(bool nullToAbsent) {
    return UserFavoriteCharactersCompanion(
      id: Value(id),
      characterData: Value(characterData),
      characterName: Value(characterName),
    );
  }

  factory UserFavoriteCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFavoriteCharacter(
      id: serializer.fromJson<int>(json['id']),
      characterData: serializer.fromJson<String>(json['characterData']),
      characterName: serializer.fromJson<String>(json['characterName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterData': serializer.toJson<String>(characterData),
      'characterName': serializer.toJson<String>(characterName),
    };
  }

  UserFavoriteCharacter copyWith(
          {int? id, String? characterData, String? characterName}) =>
      UserFavoriteCharacter(
        id: id ?? this.id,
        characterData: characterData ?? this.characterData,
        characterName: characterName ?? this.characterName,
      );
  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharacter(')
          ..write('id: $id, ')
          ..write('characterData: $characterData, ')
          ..write('characterName: $characterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterData, characterName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteCharacter &&
          other.id == this.id &&
          other.characterData == this.characterData &&
          other.characterName == this.characterName);
}

class UserFavoriteCharactersCompanion
    extends UpdateCompanion<UserFavoriteCharacter> {
  final Value<int> id;
  final Value<String> characterData;
  final Value<String> characterName;
  const UserFavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.characterData = const Value.absent(),
    this.characterName = const Value.absent(),
  });
  UserFavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String characterData,
    required String characterName,
  })  : characterData = Value(characterData),
        characterName = Value(characterName);
  static Insertable<UserFavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? characterData,
    Expression<String>? characterName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterData != null) 'character_data': characterData,
      if (characterName != null) 'character_name': characterName,
    });
  }

  UserFavoriteCharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? characterData,
      Value<String>? characterName}) {
    return UserFavoriteCharactersCompanion(
      id: id ?? this.id,
      characterData: characterData ?? this.characterData,
      characterName: characterName ?? this.characterName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (characterData.present) {
      map['character_data'] = Variable<String>(characterData.value);
    }
    if (characterName.present) {
      map['character_name'] = Variable<String>(characterName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharactersCompanion(')
          ..write('id: $id, ')
          ..write('characterData: $characterData, ')
          ..write('characterName: $characterName')
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
