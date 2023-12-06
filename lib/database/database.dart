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

  @override
  Set<Column> get primaryKey => {id};
}

class ArmorItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class AccessoryItems extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get subCategory => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CharacterItems, ArmorItems, AccessoryItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app.db'));

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

void deleteDatabase() async {
  final dbFolder = await getApplicationDocumentsDirectory();
  final file = File(path.join(dbFolder.path, 'app.db'));

  if (await file.exists()) {
    await file.delete();
    print('존재한다 그러므로 삭제한다');
  } else {
    print('ss');
  }
}
