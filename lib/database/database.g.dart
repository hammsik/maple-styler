// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CharacterItemsTable extends CharacterItems
    with TableInfo<$CharacterItemsTable, CharacterItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  @override
  late final GeneratedColumn<int> itemid = GeneratedColumn<int>(
      'itemid', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [itemid, name, subCategory, gender];
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
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid']!, _itemidMeta));
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
  Set<GeneratedColumn> get $primaryKey => {itemid};
  @override
  CharacterItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterItem(
      itemid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itemid'])!,
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
  final int itemid;
  final String name;
  final String subCategory;
  final int gender;
  const CharacterItem(
      {required this.itemid,
      required this.name,
      required this.subCategory,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itemid'] = Variable<int>(itemid);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    return map;
  }

  CharacterItemsCompanion toCompanion(bool nullToAbsent) {
    return CharacterItemsCompanion(
      itemid: Value(itemid),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
    );
  }

  factory CharacterItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterItem(
      itemid: serializer.fromJson<int>(json['itemid']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemid': serializer.toJson<int>(itemid),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
    };
  }

  CharacterItem copyWith(
          {int? itemid, String? name, String? subCategory, int? gender}) =>
      CharacterItem(
        itemid: itemid ?? this.itemid,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
      );
  CharacterItem copyWithCompanion(CharacterItemsCompanion data) {
    return CharacterItem(
      itemid: data.itemid.present ? data.itemid.value : this.itemid,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      gender: data.gender.present ? data.gender.value : this.gender,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterItem(')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemid, name, subCategory, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterItem &&
          other.itemid == this.itemid &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender);
}

class CharacterItemsCompanion extends UpdateCompanion<CharacterItem> {
  final Value<int> itemid;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  const CharacterItemsCompanion({
    this.itemid = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
  });
  CharacterItemsCompanion.insert({
    this.itemid = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<CharacterItem> custom({
    Expression<int>? itemid,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
  }) {
    return RawValuesInsertable({
      if (itemid != null) 'itemid': itemid,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
    });
  }

  CharacterItemsCompanion copyWith(
      {Value<int>? itemid,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender}) {
    return CharacterItemsCompanion(
      itemid: itemid ?? this.itemid,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemid.present) {
      map['itemid'] = Variable<int>(itemid.value);
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
          ..write('itemid: $itemid, ')
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
  static const VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  @override
  late final GeneratedColumn<int> itemid = GeneratedColumn<int>(
      'itemid', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [itemid, name, subCategory, gender];
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
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid']!, _itemidMeta));
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
  Set<GeneratedColumn> get $primaryKey => {itemid};
  @override
  ArmorItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArmorItem(
      itemid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itemid'])!,
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
  final int itemid;
  final String name;
  final String subCategory;
  final int gender;
  const ArmorItem(
      {required this.itemid,
      required this.name,
      required this.subCategory,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itemid'] = Variable<int>(itemid);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    return map;
  }

  ArmorItemsCompanion toCompanion(bool nullToAbsent) {
    return ArmorItemsCompanion(
      itemid: Value(itemid),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
    );
  }

  factory ArmorItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArmorItem(
      itemid: serializer.fromJson<int>(json['itemid']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemid': serializer.toJson<int>(itemid),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
    };
  }

  ArmorItem copyWith(
          {int? itemid, String? name, String? subCategory, int? gender}) =>
      ArmorItem(
        itemid: itemid ?? this.itemid,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
      );
  ArmorItem copyWithCompanion(ArmorItemsCompanion data) {
    return ArmorItem(
      itemid: data.itemid.present ? data.itemid.value : this.itemid,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      gender: data.gender.present ? data.gender.value : this.gender,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArmorItem(')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemid, name, subCategory, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArmorItem &&
          other.itemid == this.itemid &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender);
}

class ArmorItemsCompanion extends UpdateCompanion<ArmorItem> {
  final Value<int> itemid;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  const ArmorItemsCompanion({
    this.itemid = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
  });
  ArmorItemsCompanion.insert({
    this.itemid = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<ArmorItem> custom({
    Expression<int>? itemid,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
  }) {
    return RawValuesInsertable({
      if (itemid != null) 'itemid': itemid,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
    });
  }

  ArmorItemsCompanion copyWith(
      {Value<int>? itemid,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender}) {
    return ArmorItemsCompanion(
      itemid: itemid ?? this.itemid,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemid.present) {
      map['itemid'] = Variable<int>(itemid.value);
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
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $WeaponItemsTable extends WeaponItems
    with TableInfo<$WeaponItemsTable, WeaponItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeaponItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  @override
  late final GeneratedColumn<int> itemid = GeneratedColumn<int>(
      'itemid', aliasedName, false,
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
  List<GeneratedColumn> get $columns => [itemid, name, subCategory];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapon_items';
  @override
  VerificationContext validateIntegrity(Insertable<WeaponItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid']!, _itemidMeta));
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
  Set<GeneratedColumn> get $primaryKey => {itemid};
  @override
  WeaponItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeaponItem(
      itemid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itemid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
    );
  }

  @override
  $WeaponItemsTable createAlias(String alias) {
    return $WeaponItemsTable(attachedDatabase, alias);
  }
}

class WeaponItem extends DataClass implements Insertable<WeaponItem> {
  final int itemid;
  final String name;
  final String subCategory;
  const WeaponItem(
      {required this.itemid, required this.name, required this.subCategory});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itemid'] = Variable<int>(itemid);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    return map;
  }

  WeaponItemsCompanion toCompanion(bool nullToAbsent) {
    return WeaponItemsCompanion(
      itemid: Value(itemid),
      name: Value(name),
      subCategory: Value(subCategory),
    );
  }

  factory WeaponItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeaponItem(
      itemid: serializer.fromJson<int>(json['itemid']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemid': serializer.toJson<int>(itemid),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
    };
  }

  WeaponItem copyWith({int? itemid, String? name, String? subCategory}) =>
      WeaponItem(
        itemid: itemid ?? this.itemid,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
      );
  WeaponItem copyWithCompanion(WeaponItemsCompanion data) {
    return WeaponItem(
      itemid: data.itemid.present ? data.itemid.value : this.itemid,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeaponItem(')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemid, name, subCategory);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeaponItem &&
          other.itemid == this.itemid &&
          other.name == this.name &&
          other.subCategory == this.subCategory);
}

class WeaponItemsCompanion extends UpdateCompanion<WeaponItem> {
  final Value<int> itemid;
  final Value<String> name;
  final Value<String> subCategory;
  const WeaponItemsCompanion({
    this.itemid = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
  });
  WeaponItemsCompanion.insert({
    this.itemid = const Value.absent(),
    required String name,
    required String subCategory,
  })  : name = Value(name),
        subCategory = Value(subCategory);
  static Insertable<WeaponItem> custom({
    Expression<int>? itemid,
    Expression<String>? name,
    Expression<String>? subCategory,
  }) {
    return RawValuesInsertable({
      if (itemid != null) 'itemid': itemid,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
    });
  }

  WeaponItemsCompanion copyWith(
      {Value<int>? itemid, Value<String>? name, Value<String>? subCategory}) {
    return WeaponItemsCompanion(
      itemid: itemid ?? this.itemid,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
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
    return (StringBuffer('WeaponItemsCompanion(')
          ..write('itemid: $itemid, ')
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
  static const VerificationMeta _itemidMeta = const VerificationMeta('itemid');
  @override
  late final GeneratedColumn<int> itemid = GeneratedColumn<int>(
      'itemid', aliasedName, false,
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
  static const VerificationMeta _overlapsWithFaceMeta =
      const VerificationMeta('overlapsWithFace');
  @override
  late final GeneratedColumn<bool> overlapsWithFace = GeneratedColumn<bool>(
      'overlaps_with_face', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("overlaps_with_face" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [itemid, name, subCategory, gender, overlapsWithFace];
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
    if (data.containsKey('itemid')) {
      context.handle(_itemidMeta,
          itemid.isAcceptableOrUnknown(data['itemid']!, _itemidMeta));
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
    if (data.containsKey('overlaps_with_face')) {
      context.handle(
          _overlapsWithFaceMeta,
          overlapsWithFace.isAcceptableOrUnknown(
              data['overlaps_with_face']!, _overlapsWithFaceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemid};
  @override
  AccessoryItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccessoryItem(
      itemid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itemid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      subCategory: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sub_category'])!,
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}gender'])!,
      overlapsWithFace: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}overlaps_with_face']),
    );
  }

  @override
  $AccessoryItemsTable createAlias(String alias) {
    return $AccessoryItemsTable(attachedDatabase, alias);
  }
}

class AccessoryItem extends DataClass implements Insertable<AccessoryItem> {
  final int itemid;
  final String name;
  final String subCategory;
  final int gender;
  final bool? overlapsWithFace;
  const AccessoryItem(
      {required this.itemid,
      required this.name,
      required this.subCategory,
      required this.gender,
      this.overlapsWithFace});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['itemid'] = Variable<int>(itemid);
    map['name'] = Variable<String>(name);
    map['sub_category'] = Variable<String>(subCategory);
    map['gender'] = Variable<int>(gender);
    if (!nullToAbsent || overlapsWithFace != null) {
      map['overlaps_with_face'] = Variable<bool>(overlapsWithFace);
    }
    return map;
  }

  AccessoryItemsCompanion toCompanion(bool nullToAbsent) {
    return AccessoryItemsCompanion(
      itemid: Value(itemid),
      name: Value(name),
      subCategory: Value(subCategory),
      gender: Value(gender),
      overlapsWithFace: overlapsWithFace == null && nullToAbsent
          ? const Value.absent()
          : Value(overlapsWithFace),
    );
  }

  factory AccessoryItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccessoryItem(
      itemid: serializer.fromJson<int>(json['itemid']),
      name: serializer.fromJson<String>(json['name']),
      subCategory: serializer.fromJson<String>(json['subCategory']),
      gender: serializer.fromJson<int>(json['gender']),
      overlapsWithFace: serializer.fromJson<bool?>(json['overlapsWithFace']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemid': serializer.toJson<int>(itemid),
      'name': serializer.toJson<String>(name),
      'subCategory': serializer.toJson<String>(subCategory),
      'gender': serializer.toJson<int>(gender),
      'overlapsWithFace': serializer.toJson<bool?>(overlapsWithFace),
    };
  }

  AccessoryItem copyWith(
          {int? itemid,
          String? name,
          String? subCategory,
          int? gender,
          Value<bool?> overlapsWithFace = const Value.absent()}) =>
      AccessoryItem(
        itemid: itemid ?? this.itemid,
        name: name ?? this.name,
        subCategory: subCategory ?? this.subCategory,
        gender: gender ?? this.gender,
        overlapsWithFace: overlapsWithFace.present
            ? overlapsWithFace.value
            : this.overlapsWithFace,
      );
  AccessoryItem copyWithCompanion(AccessoryItemsCompanion data) {
    return AccessoryItem(
      itemid: data.itemid.present ? data.itemid.value : this.itemid,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
      gender: data.gender.present ? data.gender.value : this.gender,
      overlapsWithFace: data.overlapsWithFace.present
          ? data.overlapsWithFace.value
          : this.overlapsWithFace,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccessoryItem(')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender, ')
          ..write('overlapsWithFace: $overlapsWithFace')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(itemid, name, subCategory, gender, overlapsWithFace);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccessoryItem &&
          other.itemid == this.itemid &&
          other.name == this.name &&
          other.subCategory == this.subCategory &&
          other.gender == this.gender &&
          other.overlapsWithFace == this.overlapsWithFace);
}

class AccessoryItemsCompanion extends UpdateCompanion<AccessoryItem> {
  final Value<int> itemid;
  final Value<String> name;
  final Value<String> subCategory;
  final Value<int> gender;
  final Value<bool?> overlapsWithFace;
  const AccessoryItemsCompanion({
    this.itemid = const Value.absent(),
    this.name = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.gender = const Value.absent(),
    this.overlapsWithFace = const Value.absent(),
  });
  AccessoryItemsCompanion.insert({
    this.itemid = const Value.absent(),
    required String name,
    required String subCategory,
    required int gender,
    this.overlapsWithFace = const Value.absent(),
  })  : name = Value(name),
        subCategory = Value(subCategory),
        gender = Value(gender);
  static Insertable<AccessoryItem> custom({
    Expression<int>? itemid,
    Expression<String>? name,
    Expression<String>? subCategory,
    Expression<int>? gender,
    Expression<bool>? overlapsWithFace,
  }) {
    return RawValuesInsertable({
      if (itemid != null) 'itemid': itemid,
      if (name != null) 'name': name,
      if (subCategory != null) 'sub_category': subCategory,
      if (gender != null) 'gender': gender,
      if (overlapsWithFace != null) 'overlaps_with_face': overlapsWithFace,
    });
  }

  AccessoryItemsCompanion copyWith(
      {Value<int>? itemid,
      Value<String>? name,
      Value<String>? subCategory,
      Value<int>? gender,
      Value<bool?>? overlapsWithFace}) {
    return AccessoryItemsCompanion(
      itemid: itemid ?? this.itemid,
      name: name ?? this.name,
      subCategory: subCategory ?? this.subCategory,
      gender: gender ?? this.gender,
      overlapsWithFace: overlapsWithFace ?? this.overlapsWithFace,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemid.present) {
      map['itemid'] = Variable<int>(itemid.value);
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
    if (overlapsWithFace.present) {
      map['overlaps_with_face'] = Variable<bool>(overlapsWithFace.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccessoryItemsCompanion(')
          ..write('itemid: $itemid, ')
          ..write('name: $name, ')
          ..write('subCategory: $subCategory, ')
          ..write('gender: $gender, ')
          ..write('overlapsWithFace: $overlapsWithFace')
          ..write(')'))
        .toString();
  }
}

abstract class _$ItemDatabase extends GeneratedDatabase {
  _$ItemDatabase(QueryExecutor e) : super(e);
  $ItemDatabaseManager get managers => $ItemDatabaseManager(this);
  late final $CharacterItemsTable characterItems = $CharacterItemsTable(this);
  late final $ArmorItemsTable armorItems = $ArmorItemsTable(this);
  late final $WeaponItemsTable weaponItems = $WeaponItemsTable(this);
  late final $AccessoryItemsTable accessoryItems = $AccessoryItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [characterItems, armorItems, weaponItems, accessoryItems];
}

typedef $$CharacterItemsTableCreateCompanionBuilder = CharacterItemsCompanion
    Function({
  Value<int> itemid,
  required String name,
  required String subCategory,
  required int gender,
});
typedef $$CharacterItemsTableUpdateCompanionBuilder = CharacterItemsCompanion
    Function({
  Value<int> itemid,
  Value<String> name,
  Value<String> subCategory,
  Value<int> gender,
});

class $$CharacterItemsTableFilterComposer
    extends FilterComposer<_$ItemDatabase, $CharacterItemsTable> {
  $$CharacterItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$CharacterItemsTableOrderingComposer
    extends OrderingComposer<_$ItemDatabase, $CharacterItemsTable> {
  $$CharacterItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$CharacterItemsTableTableManager extends RootTableManager<
    _$ItemDatabase,
    $CharacterItemsTable,
    CharacterItem,
    $$CharacterItemsTableFilterComposer,
    $$CharacterItemsTableOrderingComposer,
    $$CharacterItemsTableCreateCompanionBuilder,
    $$CharacterItemsTableUpdateCompanionBuilder,
    (
      CharacterItem,
      BaseReferences<_$ItemDatabase, $CharacterItemsTable, CharacterItem>
    ),
    CharacterItem,
    PrefetchHooks Function()> {
  $$CharacterItemsTableTableManager(
      _$ItemDatabase db, $CharacterItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CharacterItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CharacterItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
            Value<int> gender = const Value.absent(),
          }) =>
              CharacterItemsCompanion(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
          ),
          createCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            required String name,
            required String subCategory,
            required int gender,
          }) =>
              CharacterItemsCompanion.insert(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharacterItemsTableProcessedTableManager = ProcessedTableManager<
    _$ItemDatabase,
    $CharacterItemsTable,
    CharacterItem,
    $$CharacterItemsTableFilterComposer,
    $$CharacterItemsTableOrderingComposer,
    $$CharacterItemsTableCreateCompanionBuilder,
    $$CharacterItemsTableUpdateCompanionBuilder,
    (
      CharacterItem,
      BaseReferences<_$ItemDatabase, $CharacterItemsTable, CharacterItem>
    ),
    CharacterItem,
    PrefetchHooks Function()>;
typedef $$ArmorItemsTableCreateCompanionBuilder = ArmorItemsCompanion Function({
  Value<int> itemid,
  required String name,
  required String subCategory,
  required int gender,
});
typedef $$ArmorItemsTableUpdateCompanionBuilder = ArmorItemsCompanion Function({
  Value<int> itemid,
  Value<String> name,
  Value<String> subCategory,
  Value<int> gender,
});

class $$ArmorItemsTableFilterComposer
    extends FilterComposer<_$ItemDatabase, $ArmorItemsTable> {
  $$ArmorItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ArmorItemsTableOrderingComposer
    extends OrderingComposer<_$ItemDatabase, $ArmorItemsTable> {
  $$ArmorItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$ArmorItemsTableTableManager extends RootTableManager<
    _$ItemDatabase,
    $ArmorItemsTable,
    ArmorItem,
    $$ArmorItemsTableFilterComposer,
    $$ArmorItemsTableOrderingComposer,
    $$ArmorItemsTableCreateCompanionBuilder,
    $$ArmorItemsTableUpdateCompanionBuilder,
    (ArmorItem, BaseReferences<_$ItemDatabase, $ArmorItemsTable, ArmorItem>),
    ArmorItem,
    PrefetchHooks Function()> {
  $$ArmorItemsTableTableManager(_$ItemDatabase db, $ArmorItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ArmorItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ArmorItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
            Value<int> gender = const Value.absent(),
          }) =>
              ArmorItemsCompanion(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
          ),
          createCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            required String name,
            required String subCategory,
            required int gender,
          }) =>
              ArmorItemsCompanion.insert(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ArmorItemsTableProcessedTableManager = ProcessedTableManager<
    _$ItemDatabase,
    $ArmorItemsTable,
    ArmorItem,
    $$ArmorItemsTableFilterComposer,
    $$ArmorItemsTableOrderingComposer,
    $$ArmorItemsTableCreateCompanionBuilder,
    $$ArmorItemsTableUpdateCompanionBuilder,
    (ArmorItem, BaseReferences<_$ItemDatabase, $ArmorItemsTable, ArmorItem>),
    ArmorItem,
    PrefetchHooks Function()>;
typedef $$WeaponItemsTableCreateCompanionBuilder = WeaponItemsCompanion
    Function({
  Value<int> itemid,
  required String name,
  required String subCategory,
});
typedef $$WeaponItemsTableUpdateCompanionBuilder = WeaponItemsCompanion
    Function({
  Value<int> itemid,
  Value<String> name,
  Value<String> subCategory,
});

class $$WeaponItemsTableFilterComposer
    extends FilterComposer<_$ItemDatabase, $WeaponItemsTable> {
  $$WeaponItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WeaponItemsTableOrderingComposer
    extends OrderingComposer<_$ItemDatabase, $WeaponItemsTable> {
  $$WeaponItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$WeaponItemsTableTableManager extends RootTableManager<
    _$ItemDatabase,
    $WeaponItemsTable,
    WeaponItem,
    $$WeaponItemsTableFilterComposer,
    $$WeaponItemsTableOrderingComposer,
    $$WeaponItemsTableCreateCompanionBuilder,
    $$WeaponItemsTableUpdateCompanionBuilder,
    (WeaponItem, BaseReferences<_$ItemDatabase, $WeaponItemsTable, WeaponItem>),
    WeaponItem,
    PrefetchHooks Function()> {
  $$WeaponItemsTableTableManager(_$ItemDatabase db, $WeaponItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WeaponItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WeaponItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
          }) =>
              WeaponItemsCompanion(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
          ),
          createCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            required String name,
            required String subCategory,
          }) =>
              WeaponItemsCompanion.insert(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WeaponItemsTableProcessedTableManager = ProcessedTableManager<
    _$ItemDatabase,
    $WeaponItemsTable,
    WeaponItem,
    $$WeaponItemsTableFilterComposer,
    $$WeaponItemsTableOrderingComposer,
    $$WeaponItemsTableCreateCompanionBuilder,
    $$WeaponItemsTableUpdateCompanionBuilder,
    (WeaponItem, BaseReferences<_$ItemDatabase, $WeaponItemsTable, WeaponItem>),
    WeaponItem,
    PrefetchHooks Function()>;
typedef $$AccessoryItemsTableCreateCompanionBuilder = AccessoryItemsCompanion
    Function({
  Value<int> itemid,
  required String name,
  required String subCategory,
  required int gender,
  Value<bool?> overlapsWithFace,
});
typedef $$AccessoryItemsTableUpdateCompanionBuilder = AccessoryItemsCompanion
    Function({
  Value<int> itemid,
  Value<String> name,
  Value<String> subCategory,
  Value<int> gender,
  Value<bool?> overlapsWithFace,
});

class $$AccessoryItemsTableFilterComposer
    extends FilterComposer<_$ItemDatabase, $AccessoryItemsTable> {
  $$AccessoryItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get overlapsWithFace => $state.composableBuilder(
      column: $state.table.overlapsWithFace,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AccessoryItemsTableOrderingComposer
    extends OrderingComposer<_$ItemDatabase, $AccessoryItemsTable> {
  $$AccessoryItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gender => $state.composableBuilder(
      column: $state.table.gender,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get overlapsWithFace => $state.composableBuilder(
      column: $state.table.overlapsWithFace,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AccessoryItemsTableTableManager extends RootTableManager<
    _$ItemDatabase,
    $AccessoryItemsTable,
    AccessoryItem,
    $$AccessoryItemsTableFilterComposer,
    $$AccessoryItemsTableOrderingComposer,
    $$AccessoryItemsTableCreateCompanionBuilder,
    $$AccessoryItemsTableUpdateCompanionBuilder,
    (
      AccessoryItem,
      BaseReferences<_$ItemDatabase, $AccessoryItemsTable, AccessoryItem>
    ),
    AccessoryItem,
    PrefetchHooks Function()> {
  $$AccessoryItemsTableTableManager(
      _$ItemDatabase db, $AccessoryItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AccessoryItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AccessoryItemsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
            Value<int> gender = const Value.absent(),
            Value<bool?> overlapsWithFace = const Value.absent(),
          }) =>
              AccessoryItemsCompanion(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
            overlapsWithFace: overlapsWithFace,
          ),
          createCompanionCallback: ({
            Value<int> itemid = const Value.absent(),
            required String name,
            required String subCategory,
            required int gender,
            Value<bool?> overlapsWithFace = const Value.absent(),
          }) =>
              AccessoryItemsCompanion.insert(
            itemid: itemid,
            name: name,
            subCategory: subCategory,
            gender: gender,
            overlapsWithFace: overlapsWithFace,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AccessoryItemsTableProcessedTableManager = ProcessedTableManager<
    _$ItemDatabase,
    $AccessoryItemsTable,
    AccessoryItem,
    $$AccessoryItemsTableFilterComposer,
    $$AccessoryItemsTableOrderingComposer,
    $$AccessoryItemsTableCreateCompanionBuilder,
    $$AccessoryItemsTableUpdateCompanionBuilder,
    (
      AccessoryItem,
      BaseReferences<_$ItemDatabase, $AccessoryItemsTable, AccessoryItem>
    ),
    AccessoryItem,
    PrefetchHooks Function()>;

class $ItemDatabaseManager {
  final _$ItemDatabase _db;
  $ItemDatabaseManager(this._db);
  $$CharacterItemsTableTableManager get characterItems =>
      $$CharacterItemsTableTableManager(_db, _db.characterItems);
  $$ArmorItemsTableTableManager get armorItems =>
      $$ArmorItemsTableTableManager(_db, _db.armorItems);
  $$WeaponItemsTableTableManager get weaponItems =>
      $$WeaponItemsTableTableManager(_db, _db.weaponItems);
  $$AccessoryItemsTableTableManager get accessoryItems =>
      $$AccessoryItemsTableTableManager(_db, _db.accessoryItems);
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
  UserFavoriteItem copyWithCompanion(UserFavoriteItemsCompanion data) {
    return UserFavoriteItem(
      id: data.id.present ? data.id.value : this.id,
      itemid: data.itemid.present ? data.itemid.value : this.itemid,
      name: data.name.present ? data.name.value : this.name,
      subCategory:
          data.subCategory.present ? data.subCategory.value : this.subCategory,
    );
  }

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
  static const VerificationMeta _characterInfoMeta =
      const VerificationMeta('characterInfo');
  @override
  late final GeneratedColumn<String> characterInfo = GeneratedColumn<String>(
      'character_info', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterInfo2Meta =
      const VerificationMeta('characterInfo2');
  @override
  late final GeneratedColumn<String> characterInfo2 = GeneratedColumn<String>(
      'character_info2', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterImageUrl1Meta =
      const VerificationMeta('characterImageUrl1');
  @override
  late final GeneratedColumn<String> characterImageUrl1 =
      GeneratedColumn<String>('character_image_url1', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterImageUrl2Meta =
      const VerificationMeta('characterImageUrl2');
  @override
  late final GeneratedColumn<String> characterImageUrl2 =
      GeneratedColumn<String>('character_image_url2', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _characterNameMeta =
      const VerificationMeta('characterName');
  @override
  late final GeneratedColumn<String> characterName = GeneratedColumn<String>(
      'character_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        characterInfo,
        characterInfo2,
        characterImageUrl1,
        characterImageUrl2,
        characterName
      ];
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
    if (data.containsKey('character_info2')) {
      context.handle(
          _characterInfo2Meta,
          characterInfo2.isAcceptableOrUnknown(
              data['character_info2']!, _characterInfo2Meta));
    } else if (isInserting) {
      context.missing(_characterInfo2Meta);
    }
    if (data.containsKey('character_image_url1')) {
      context.handle(
          _characterImageUrl1Meta,
          characterImageUrl1.isAcceptableOrUnknown(
              data['character_image_url1']!, _characterImageUrl1Meta));
    } else if (isInserting) {
      context.missing(_characterImageUrl1Meta);
    }
    if (data.containsKey('character_image_url2')) {
      context.handle(
          _characterImageUrl2Meta,
          characterImageUrl2.isAcceptableOrUnknown(
              data['character_image_url2']!, _characterImageUrl2Meta));
    } else if (isInserting) {
      context.missing(_characterImageUrl2Meta);
    }
    if (data.containsKey('character_name')) {
      context.handle(
          _characterNameMeta,
          characterName.isAcceptableOrUnknown(
              data['character_name']!, _characterNameMeta));
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
      characterInfo2: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_info2'])!,
      characterImageUrl1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_image_url1'])!,
      characterImageUrl2: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_image_url2'])!,
      characterName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_name']),
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
  final String characterInfo2;
  final String characterImageUrl1;
  final String characterImageUrl2;
  final String? characterName;
  const UserFavoriteCharacter(
      {required this.id,
      required this.characterInfo,
      required this.characterInfo2,
      required this.characterImageUrl1,
      required this.characterImageUrl2,
      this.characterName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_info'] = Variable<String>(characterInfo);
    map['character_info2'] = Variable<String>(characterInfo2);
    map['character_image_url1'] = Variable<String>(characterImageUrl1);
    map['character_image_url2'] = Variable<String>(characterImageUrl2);
    if (!nullToAbsent || characterName != null) {
      map['character_name'] = Variable<String>(characterName);
    }
    return map;
  }

  UserFavoriteCharactersCompanion toCompanion(bool nullToAbsent) {
    return UserFavoriteCharactersCompanion(
      id: Value(id),
      characterInfo: Value(characterInfo),
      characterInfo2: Value(characterInfo2),
      characterImageUrl1: Value(characterImageUrl1),
      characterImageUrl2: Value(characterImageUrl2),
      characterName: characterName == null && nullToAbsent
          ? const Value.absent()
          : Value(characterName),
    );
  }

  factory UserFavoriteCharacter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFavoriteCharacter(
      id: serializer.fromJson<int>(json['id']),
      characterInfo: serializer.fromJson<String>(json['characterInfo']),
      characterInfo2: serializer.fromJson<String>(json['characterInfo2']),
      characterImageUrl1:
          serializer.fromJson<String>(json['characterImageUrl1']),
      characterImageUrl2:
          serializer.fromJson<String>(json['characterImageUrl2']),
      characterName: serializer.fromJson<String?>(json['characterName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterInfo': serializer.toJson<String>(characterInfo),
      'characterInfo2': serializer.toJson<String>(characterInfo2),
      'characterImageUrl1': serializer.toJson<String>(characterImageUrl1),
      'characterImageUrl2': serializer.toJson<String>(characterImageUrl2),
      'characterName': serializer.toJson<String?>(characterName),
    };
  }

  UserFavoriteCharacter copyWith(
          {int? id,
          String? characterInfo,
          String? characterInfo2,
          String? characterImageUrl1,
          String? characterImageUrl2,
          Value<String?> characterName = const Value.absent()}) =>
      UserFavoriteCharacter(
        id: id ?? this.id,
        characterInfo: characterInfo ?? this.characterInfo,
        characterInfo2: characterInfo2 ?? this.characterInfo2,
        characterImageUrl1: characterImageUrl1 ?? this.characterImageUrl1,
        characterImageUrl2: characterImageUrl2 ?? this.characterImageUrl2,
        characterName:
            characterName.present ? characterName.value : this.characterName,
      );
  UserFavoriteCharacter copyWithCompanion(
      UserFavoriteCharactersCompanion data) {
    return UserFavoriteCharacter(
      id: data.id.present ? data.id.value : this.id,
      characterInfo: data.characterInfo.present
          ? data.characterInfo.value
          : this.characterInfo,
      characterInfo2: data.characterInfo2.present
          ? data.characterInfo2.value
          : this.characterInfo2,
      characterImageUrl1: data.characterImageUrl1.present
          ? data.characterImageUrl1.value
          : this.characterImageUrl1,
      characterImageUrl2: data.characterImageUrl2.present
          ? data.characterImageUrl2.value
          : this.characterImageUrl2,
      characterName: data.characterName.present
          ? data.characterName.value
          : this.characterName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharacter(')
          ..write('id: $id, ')
          ..write('characterInfo: $characterInfo, ')
          ..write('characterInfo2: $characterInfo2, ')
          ..write('characterImageUrl1: $characterImageUrl1, ')
          ..write('characterImageUrl2: $characterImageUrl2, ')
          ..write('characterName: $characterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterInfo, characterInfo2,
      characterImageUrl1, characterImageUrl2, characterName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteCharacter &&
          other.id == this.id &&
          other.characterInfo == this.characterInfo &&
          other.characterInfo2 == this.characterInfo2 &&
          other.characterImageUrl1 == this.characterImageUrl1 &&
          other.characterImageUrl2 == this.characterImageUrl2 &&
          other.characterName == this.characterName);
}

class UserFavoriteCharactersCompanion
    extends UpdateCompanion<UserFavoriteCharacter> {
  final Value<int> id;
  final Value<String> characterInfo;
  final Value<String> characterInfo2;
  final Value<String> characterImageUrl1;
  final Value<String> characterImageUrl2;
  final Value<String?> characterName;
  const UserFavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.characterInfo = const Value.absent(),
    this.characterInfo2 = const Value.absent(),
    this.characterImageUrl1 = const Value.absent(),
    this.characterImageUrl2 = const Value.absent(),
    this.characterName = const Value.absent(),
  });
  UserFavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String characterInfo,
    required String characterInfo2,
    required String characterImageUrl1,
    required String characterImageUrl2,
    this.characterName = const Value.absent(),
  })  : characterInfo = Value(characterInfo),
        characterInfo2 = Value(characterInfo2),
        characterImageUrl1 = Value(characterImageUrl1),
        characterImageUrl2 = Value(characterImageUrl2);
  static Insertable<UserFavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? characterInfo,
    Expression<String>? characterInfo2,
    Expression<String>? characterImageUrl1,
    Expression<String>? characterImageUrl2,
    Expression<String>? characterName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterInfo != null) 'character_info': characterInfo,
      if (characterInfo2 != null) 'character_info2': characterInfo2,
      if (characterImageUrl1 != null)
        'character_image_url1': characterImageUrl1,
      if (characterImageUrl2 != null)
        'character_image_url2': characterImageUrl2,
      if (characterName != null) 'character_name': characterName,
    });
  }

  UserFavoriteCharactersCompanion copyWith(
      {Value<int>? id,
      Value<String>? characterInfo,
      Value<String>? characterInfo2,
      Value<String>? characterImageUrl1,
      Value<String>? characterImageUrl2,
      Value<String?>? characterName}) {
    return UserFavoriteCharactersCompanion(
      id: id ?? this.id,
      characterInfo: characterInfo ?? this.characterInfo,
      characterInfo2: characterInfo2 ?? this.characterInfo2,
      characterImageUrl1: characterImageUrl1 ?? this.characterImageUrl1,
      characterImageUrl2: characterImageUrl2 ?? this.characterImageUrl2,
      characterName: characterName ?? this.characterName,
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
    if (characterInfo2.present) {
      map['character_info2'] = Variable<String>(characterInfo2.value);
    }
    if (characterImageUrl1.present) {
      map['character_image_url1'] = Variable<String>(characterImageUrl1.value);
    }
    if (characterImageUrl2.present) {
      map['character_image_url2'] = Variable<String>(characterImageUrl2.value);
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
          ..write('characterInfo: $characterInfo, ')
          ..write('characterInfo2: $characterInfo2, ')
          ..write('characterImageUrl1: $characterImageUrl1, ')
          ..write('characterImageUrl2: $characterImageUrl2, ')
          ..write('characterName: $characterName')
          ..write(')'))
        .toString();
  }
}

abstract class _$UserFavoriteDataBase extends GeneratedDatabase {
  _$UserFavoriteDataBase(QueryExecutor e) : super(e);
  $UserFavoriteDataBaseManager get managers =>
      $UserFavoriteDataBaseManager(this);
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

typedef $$UserFavoriteItemsTableCreateCompanionBuilder
    = UserFavoriteItemsCompanion Function({
  Value<int> id,
  required int itemid,
  required String name,
  required String subCategory,
});
typedef $$UserFavoriteItemsTableUpdateCompanionBuilder
    = UserFavoriteItemsCompanion Function({
  Value<int> id,
  Value<int> itemid,
  Value<String> name,
  Value<String> subCategory,
});

class $$UserFavoriteItemsTableFilterComposer
    extends FilterComposer<_$UserFavoriteDataBase, $UserFavoriteItemsTable> {
  $$UserFavoriteItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserFavoriteItemsTableOrderingComposer
    extends OrderingComposer<_$UserFavoriteDataBase, $UserFavoriteItemsTable> {
  $$UserFavoriteItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itemid => $state.composableBuilder(
      column: $state.table.itemid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get subCategory => $state.composableBuilder(
      column: $state.table.subCategory,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserFavoriteItemsTableTableManager extends RootTableManager<
    _$UserFavoriteDataBase,
    $UserFavoriteItemsTable,
    UserFavoriteItem,
    $$UserFavoriteItemsTableFilterComposer,
    $$UserFavoriteItemsTableOrderingComposer,
    $$UserFavoriteItemsTableCreateCompanionBuilder,
    $$UserFavoriteItemsTableUpdateCompanionBuilder,
    (
      UserFavoriteItem,
      BaseReferences<_$UserFavoriteDataBase, $UserFavoriteItemsTable,
          UserFavoriteItem>
    ),
    UserFavoriteItem,
    PrefetchHooks Function()> {
  $$UserFavoriteItemsTableTableManager(
      _$UserFavoriteDataBase db, $UserFavoriteItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserFavoriteItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$UserFavoriteItemsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> itemid = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> subCategory = const Value.absent(),
          }) =>
              UserFavoriteItemsCompanion(
            id: id,
            itemid: itemid,
            name: name,
            subCategory: subCategory,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int itemid,
            required String name,
            required String subCategory,
          }) =>
              UserFavoriteItemsCompanion.insert(
            id: id,
            itemid: itemid,
            name: name,
            subCategory: subCategory,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserFavoriteItemsTableProcessedTableManager = ProcessedTableManager<
    _$UserFavoriteDataBase,
    $UserFavoriteItemsTable,
    UserFavoriteItem,
    $$UserFavoriteItemsTableFilterComposer,
    $$UserFavoriteItemsTableOrderingComposer,
    $$UserFavoriteItemsTableCreateCompanionBuilder,
    $$UserFavoriteItemsTableUpdateCompanionBuilder,
    (
      UserFavoriteItem,
      BaseReferences<_$UserFavoriteDataBase, $UserFavoriteItemsTable,
          UserFavoriteItem>
    ),
    UserFavoriteItem,
    PrefetchHooks Function()>;
typedef $$UserFavoriteCharactersTableCreateCompanionBuilder
    = UserFavoriteCharactersCompanion Function({
  Value<int> id,
  required String characterInfo,
  required String characterInfo2,
  required String characterImageUrl1,
  required String characterImageUrl2,
  Value<String?> characterName,
});
typedef $$UserFavoriteCharactersTableUpdateCompanionBuilder
    = UserFavoriteCharactersCompanion Function({
  Value<int> id,
  Value<String> characterInfo,
  Value<String> characterInfo2,
  Value<String> characterImageUrl1,
  Value<String> characterImageUrl2,
  Value<String?> characterName,
});

class $$UserFavoriteCharactersTableFilterComposer extends FilterComposer<
    _$UserFavoriteDataBase, $UserFavoriteCharactersTable> {
  $$UserFavoriteCharactersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterInfo => $state.composableBuilder(
      column: $state.table.characterInfo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterInfo2 => $state.composableBuilder(
      column: $state.table.characterInfo2,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterImageUrl1 => $state.composableBuilder(
      column: $state.table.characterImageUrl1,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterImageUrl2 => $state.composableBuilder(
      column: $state.table.characterImageUrl2,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserFavoriteCharactersTableOrderingComposer extends OrderingComposer<
    _$UserFavoriteDataBase, $UserFavoriteCharactersTable> {
  $$UserFavoriteCharactersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterInfo => $state.composableBuilder(
      column: $state.table.characterInfo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterInfo2 => $state.composableBuilder(
      column: $state.table.characterInfo2,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterImageUrl1 => $state.composableBuilder(
      column: $state.table.characterImageUrl1,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterImageUrl2 => $state.composableBuilder(
      column: $state.table.characterImageUrl2,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get characterName => $state.composableBuilder(
      column: $state.table.characterName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserFavoriteCharactersTableTableManager extends RootTableManager<
    _$UserFavoriteDataBase,
    $UserFavoriteCharactersTable,
    UserFavoriteCharacter,
    $$UserFavoriteCharactersTableFilterComposer,
    $$UserFavoriteCharactersTableOrderingComposer,
    $$UserFavoriteCharactersTableCreateCompanionBuilder,
    $$UserFavoriteCharactersTableUpdateCompanionBuilder,
    (
      UserFavoriteCharacter,
      BaseReferences<_$UserFavoriteDataBase, $UserFavoriteCharactersTable,
          UserFavoriteCharacter>
    ),
    UserFavoriteCharacter,
    PrefetchHooks Function()> {
  $$UserFavoriteCharactersTableTableManager(
      _$UserFavoriteDataBase db, $UserFavoriteCharactersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$UserFavoriteCharactersTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$UserFavoriteCharactersTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> characterInfo = const Value.absent(),
            Value<String> characterInfo2 = const Value.absent(),
            Value<String> characterImageUrl1 = const Value.absent(),
            Value<String> characterImageUrl2 = const Value.absent(),
            Value<String?> characterName = const Value.absent(),
          }) =>
              UserFavoriteCharactersCompanion(
            id: id,
            characterInfo: characterInfo,
            characterInfo2: characterInfo2,
            characterImageUrl1: characterImageUrl1,
            characterImageUrl2: characterImageUrl2,
            characterName: characterName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String characterInfo,
            required String characterInfo2,
            required String characterImageUrl1,
            required String characterImageUrl2,
            Value<String?> characterName = const Value.absent(),
          }) =>
              UserFavoriteCharactersCompanion.insert(
            id: id,
            characterInfo: characterInfo,
            characterInfo2: characterInfo2,
            characterImageUrl1: characterImageUrl1,
            characterImageUrl2: characterImageUrl2,
            characterName: characterName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserFavoriteCharactersTableProcessedTableManager
    = ProcessedTableManager<
        _$UserFavoriteDataBase,
        $UserFavoriteCharactersTable,
        UserFavoriteCharacter,
        $$UserFavoriteCharactersTableFilterComposer,
        $$UserFavoriteCharactersTableOrderingComposer,
        $$UserFavoriteCharactersTableCreateCompanionBuilder,
        $$UserFavoriteCharactersTableUpdateCompanionBuilder,
        (
          UserFavoriteCharacter,
          BaseReferences<_$UserFavoriteDataBase, $UserFavoriteCharactersTable,
              UserFavoriteCharacter>
        ),
        UserFavoriteCharacter,
        PrefetchHooks Function()>;

class $UserFavoriteDataBaseManager {
  final _$UserFavoriteDataBase _db;
  $UserFavoriteDataBaseManager(this._db);
  $$UserFavoriteItemsTableTableManager get userFavoriteItems =>
      $$UserFavoriteItemsTableTableManager(_db, _db.userFavoriteItems);
  $$UserFavoriteCharactersTableTableManager get userFavoriteCharacters =>
      $$UserFavoriteCharactersTableTableManager(
          _db, _db.userFavoriteCharacters);
}
