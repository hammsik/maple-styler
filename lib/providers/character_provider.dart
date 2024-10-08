import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/item_map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_provider.g.dart';

// 앱 전역에서 수시로 사용되므로 keepAlive: true로 설정
@Riverpod(keepAlive: true)
class CharacterProvider extends _$CharacterProvider {
  @override
  ItemMap build() {
    return const ItemMap(
      head: Item(id: '12016', name: '홍조 꽃잎 피부'),
      body: Item(id: '2016', name: ''),
    );
  }

  void updateCharacter({required String subCategory, required Item item}) {
    state = state.copyWith(
      head: subCategory == 'head' ? item : state.head,
      body: subCategory == 'body' ? item : state.body,
    );
  }
}
