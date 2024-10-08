import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/item.dart';

part 'item_map.freezed.dart';
part 'item_map.g.dart';

// 코디 아이템을 모아놓은 맵
@freezed
class ItemMap with _$ItemMap {
  const factory ItemMap({
    // 뷰티
    Item? hair,
    Item? face,
    required Item head,
    required Item body,
    // 장비
    Item? hat,
    Item? overrAll,
    Item? cash,
    Item? top,
    Item? bottom,
    Item? cape,
    Item? glove,
    Item? shoes,
    Item? shield,
    // 악세
    Item? faceAccessory,
    Item? eyeDecoration,
    Item? earrings,
  }) = _ItemMap;

  factory ItemMap.fromJson(Map<String, Object?> json)
      => _$ItemMapFromJson (json);
}