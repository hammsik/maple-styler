import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class CharacterItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class ArmorItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class AccessoryItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();
  IntColumn get gender => integer()();
  BoolColumn get isFullFaceCover => boolean().nullable()();

  @override
  Set<Column> get primaryKey => {id};
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
}

@DriftDatabase(tables: [CharacterItems, ArmorItems, AccessoryItems])
class ItemDatabase extends _$ItemDatabase {
  ItemDatabase() : super(_openItemDBConnection());

  @override
  int get schemaVersion => 1;
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
  int get schemaVersion => 1;
}

LazyDatabase _openItemDBConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'item.db'));

    if (!await file.exists()) {
      // Extract the pre-populated database file from assets
      print('New database has been created.');
      final blob = await rootBundle.load('assets/maple_styler_item_db.sqlite');
      final buffer = blob.buffer;
      await file.writeAsBytes(
          buffer.asUint8List(blob.offsetInBytes, blob.lengthInBytes));
    }

    return NativeDatabase.createInBackground(file);
  });
}

LazyDatabase _openUserDBConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'user.db'));
    return NativeDatabase.createInBackground(file);
  });
}

void deleteDatabase(String targetDB) async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(path.join(dbFolder.path, targetDB));

  if (await file.exists()) {
    await file.delete();
    print('존재한다 그러므로 삭제한다');
  } else {
    print('ss');
  }
}
