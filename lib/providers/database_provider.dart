import 'package:maple_closet/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
ItemDatabase mapleItemDatabase(MapleItemDatabaseRef ref) {
  return ItemDatabase();
}

@Riverpod(keepAlive: true)
UserFavoriteDataBase mapleUserFavoriteDatabase(MapleUserFavoriteDatabaseRef ref) {
  return UserFavoriteDataBase();
}