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
  static const VerificationMeta _characterInfo1Meta =
      const VerificationMeta('characterInfo1');
  @override
  late final GeneratedColumn<String> characterInfo1 = GeneratedColumn<String>(
      'character_info1', aliasedName, false,
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
        characterInfo1,
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
    if (data.containsKey('character_info1')) {
      context.handle(
          _characterInfo1Meta,
          characterInfo1.isAcceptableOrUnknown(
              data['character_info1']!, _characterInfo1Meta));
    } else if (isInserting) {
      context.missing(_characterInfo1Meta);
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
      characterInfo1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_info1'])!,
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
  final String characterInfo1;
  final String characterInfo2;
  final String characterImageUrl1;
  final String characterImageUrl2;
  final String? characterName;
  const UserFavoriteCharacter(
      {required this.id,
      required this.characterInfo1,
      required this.characterInfo2,
      required this.characterImageUrl1,
      required this.characterImageUrl2,
      this.characterName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['character_info1'] = Variable<String>(characterInfo1);
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
      characterInfo1: Value(characterInfo1),
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
      characterInfo1: serializer.fromJson<String>(json['characterInfo1']),
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
      'characterInfo1': serializer.toJson<String>(characterInfo1),
      'characterInfo2': serializer.toJson<String>(characterInfo2),
      'characterImageUrl1': serializer.toJson<String>(characterImageUrl1),
      'characterImageUrl2': serializer.toJson<String>(characterImageUrl2),
      'characterName': serializer.toJson<String?>(characterName),
    };
  }

  UserFavoriteCharacter copyWith(
          {int? id,
          String? characterInfo1,
          String? characterInfo2,
          String? characterImageUrl1,
          String? characterImageUrl2,
          Value<String?> characterName = const Value.absent()}) =>
      UserFavoriteCharacter(
        id: id ?? this.id,
        characterInfo1: characterInfo1 ?? this.characterInfo1,
        characterInfo2: characterInfo2 ?? this.characterInfo2,
        characterImageUrl1: characterImageUrl1 ?? this.characterImageUrl1,
        characterImageUrl2: characterImageUrl2 ?? this.characterImageUrl2,
        characterName:
            characterName.present ? characterName.value : this.characterName,
      );
  @override
  String toString() {
    return (StringBuffer('UserFavoriteCharacter(')
          ..write('id: $id, ')
          ..write('characterInfo1: $characterInfo1, ')
          ..write('characterInfo2: $characterInfo2, ')
          ..write('characterImageUrl1: $characterImageUrl1, ')
          ..write('characterImageUrl2: $characterImageUrl2, ')
          ..write('characterName: $characterName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterInfo1, characterInfo2,
      characterImageUrl1, characterImageUrl2, characterName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFavoriteCharacter &&
          other.id == this.id &&
          other.characterInfo1 == this.characterInfo1 &&
          other.characterInfo2 == this.characterInfo2 &&
          other.characterImageUrl1 == this.characterImageUrl1 &&
          other.characterImageUrl2 == this.characterImageUrl2 &&
          other.characterName == this.characterName);
}

class UserFavoriteCharactersCompanion
    extends UpdateCompanion<UserFavoriteCharacter> {
  final Value<int> id;
  final Value<String> characterInfo1;
  final Value<String> characterInfo2;
  final Value<String> characterImageUrl1;
  final Value<String> characterImageUrl2;
  final Value<String?> characterName;
  const UserFavoriteCharactersCompanion({
    this.id = const Value.absent(),
    this.characterInfo1 = const Value.absent(),
    this.characterInfo2 = const Value.absent(),
    this.characterImageUrl1 = const Value.absent(),
    this.characterImageUrl2 = const Value.absent(),
    this.characterName = const Value.absent(),
  });
  UserFavoriteCharactersCompanion.insert({
    this.id = const Value.absent(),
    required String characterInfo1,
    required String characterInfo2,
    required String characterImageUrl1,
    required String characterImageUrl2,
    this.characterName = const Value.absent(),
  })  : characterInfo1 = Value(characterInfo1),
        characterInfo2 = Value(characterInfo2),
        characterImageUrl1 = Value(characterImageUrl1),
        characterImageUrl2 = Value(characterImageUrl2);
  static Insertable<UserFavoriteCharacter> custom({
    Expression<int>? id,
    Expression<String>? characterInfo1,
    Expression<String>? characterInfo2,
    Expression<String>? characterImageUrl1,
    Expression<String>? characterImageUrl2,
    Expression<String>? characterName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (characterInfo1 != null) 'character_info1': characterInfo1,
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
      Value<String>? characterInfo1,
      Value<String>? characterInfo2,
      Value<String>? characterImageUrl1,
      Value<String>? characterImageUrl2,
      Value<String?>? characterName}) {
    return UserFavoriteCharactersCompanion(
      id: id ?? this.id,
      characterInfo1: characterInfo1 ?? this.characterInfo1,
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
    if (characterInfo1.present) {
      map['character_info1'] = Variable<String>(characterInfo1.value);
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
          ..write('characterInfo1: $characterInfo1, ')
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
