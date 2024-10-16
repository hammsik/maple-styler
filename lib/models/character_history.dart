import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_closet/models/equipment.dart';

part 'character_history.freezed.dart';
part 'character_history.g.dart';

// 캐릭터 장비 변경 이력
@freezed
class History with _$History {
  const factory History({
    required List<Equipment> equipmentsList,
    required int maxHistoryLength,
    @Default(0) int historyIndex,
  }) = _History;

  factory History.fromJson(Map<String, Object?> json) =>
      _$HistoryFromJson(json);
}
