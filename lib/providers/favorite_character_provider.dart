import 'package:maple_closet/database/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_character_provider.g.dart';

@riverpod
class FavoriteCharacterList extends _$FavoriteCharacterList {
  @override
  Future<List<UserFavoriteCharacter>> build() async {
    final db = UserFavoriteDataBase();
    return db.select(db.userFavoriteCharacters).get();
  }
}
