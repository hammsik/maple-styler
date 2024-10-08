import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/item.dart';

part 'item_map.freezed.dart';
part 'item_map.g.dart';

// 코디 아이템을 모아놓은 맵
@freezed
class ItemMap with _$ItemMap {
  const factory ItemMap({
     // 뷰티
    @Default(Item(id: '68090', name: '허쉬 헤어')) Item? hair,
    @Default(Item(id: '50137', name: '차차 얼굴')) Item? face,
    required Item head,
    required Item body,
    // 장비
    Item? hat,
    Item? overrAll,
    Item? cash,
    @Default(Item(id: '1040036', name: '상의 이너')) Item? top,
    @Default(Item(id: '1060026', name: '하의 이너')) Item? bottom,
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