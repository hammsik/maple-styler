// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryImpl _$$HistoryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryImpl(
      equipmentsList: (json['equipmentsList'] as List<dynamic>)
          .map((e) => Equipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxHistoryLength: (json['maxHistoryLength'] as num).toInt(),
      historyIndex: (json['historyIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HistoryImplToJson(_$HistoryImpl instance) =>
    <String, dynamic>{
      'equipmentsList': instance.equipmentsList,
      'maxHistoryLength': instance.maxHistoryLength,
      'historyIndex': instance.historyIndex,
    };
