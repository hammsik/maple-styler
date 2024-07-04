import 'package:maple_closet/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
class MapleItemDatabase extends _$MapleItemDatabase {
  @override
  ItemDatabase build() {
    return ItemDatabase();
  }
}