import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/equipment.dart';

part 'character_history.freezed.dart';

// 캐릭터 장비 변경 이력
@freezed
class History with _$History {
  const factory History({
    required List<Equipment> equipments,
    required int maxHistoryLength,
    @Default(0) int historyIndex,
  }) = _History;
}
