import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class CharacterItems extends Table {
  IntColumn get itemid => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();

  @override
  Set<Column> get primaryKey => {itemid};
}

class ArmorItems extends Table {
  IntColumn get itemid => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();

  @override
  Set<Column> get primaryKey => {itemid};
}

class WeaponItems extends Table {
  IntColumn get itemid => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();

  @override
  Set<Column> get primaryKey => {itemid};
}

class AccessoryItems extends Table {
  IntColumn get itemid => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();
  BoolColumn get overlapsWithFace => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {itemid};
}

class UserFavoriteItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get itemid => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
}

class UserFavoriteCharacters extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get characterInfo => text()();
  TextColumn get characterInfo2 => text()();
  TextColumn get characterImageUrl1 => text()();
  TextColumn get characterImageUrl2 => text()();
  TextColumn get characterName => text().nullable()();
}

@DriftDatabase(
    tables: [CharacterItems, ArmorItems, WeaponItems, AccessoryItems])
class ItemDatabase extends _$ItemDatabase {
  ItemDatabase() : super(_openItemDBConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          // 새로운 db를 _openItemDBConnection()에서 추가해서 쓰는 대신, 기존거 제거
          deleteDatabase("items.db");
        }
      },
    );
  }
}

@DriftDatabase(tables: [UserFavoriteItems, UserFavoriteCharacters])
class UserFavoriteDataBase extends _$UserFavoriteDataBase {
  static final UserFavoriteDataBase _instance =
      UserFavoriteDataBase._internal();

  factory UserFavoriteDataBase() {
    return _instance;
  }

  UserFavoriteDataBase._internal() : super(_openUserDBConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.addColumn(
              userFavoriteCharacters, userFavoriteCharacters.characterInfo2);
          await m.addColumn(userFavoriteCharacters,
              userFavoriteCharacters.characterImageUrl1);
          await m.addColumn(userFavoriteCharacters,
              userFavoriteCharacters.characterImageUrl2);
          await m.addColumn(
              userFavoriteCharacters, userFavoriteCharacters.characterName);
        }
      },
    );
  }
}

LazyDatabase _openItemDBConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'item.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      final blob = await rootBundle.load('assets/maple_styler_item_db.sqlite');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
      print('New database has been created.');
    }

    return NativeDatabase.createInBackground(file);
  });
}

LazyDatabase _openUserDBConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'user.db'));
    return NativeDatabase.createInBackground(file);
  });
}

void deleteDatabase(String targetDB) async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(p.join(dbFolder.path, targetDB));

  if (await file.exists()) {
    await file.delete();
    print('존재한다 그러므로 삭제한다');
  } else {
    print('ss');
  }
}
