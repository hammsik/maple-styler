// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubCategoryImpl _$$SubCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SubCategoryImpl(
      nameKo: json['nameKo'] as String,
      nameEn: json['nameEn'] as String,
      type: $enumDecode(_$SubCategoryTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$SubCategoryImplToJson(_$SubCategoryImpl instance) =>
    <String, dynamic>{
      'nameKo': instance.nameKo,
      'nameEn': instance.nameEn,
      'type': _$SubCategoryTypeEnumMap[instance.type]!,
    };

const _$SubCategoryTypeEnumMap = {
  SubCategoryType.hair: 'hair',
  SubCategoryType.face: 'face',
  SubCategoryType.head: 'head',
  SubCategoryType.hat: 'hat',
  SubCategoryType.overall: 'overall',
  SubCategoryType.cash: 'cash',
  SubCategoryType.top: 'top',
  SubCategoryType.bottom: 'bottom',
  SubCategoryType.cape: 'cape',
  SubCategoryType.glove: 'glove',
  SubCategoryType.shoes: 'shoes',
  SubCategoryType.shield: 'shield',
  SubCategoryType.faceAccessory: 'faceAccessory',
  SubCategoryType.eyeDecoration: 'eyeDecoration',
  SubCategoryType.earrings: 'earrings',
};

_$MyToolImpl _$$MyToolImplFromJson(Map<String, dynamic> json) => _$MyToolImpl(
      toolNameKo: json['toolNameKo'] as String,
      toolType: $enumDecode(_$ToolTypeEnumMap, json['toolType']),
      idx: (json['idx'] as num).toInt(),
      subCategoryIdx: (json['subCategoryIdx'] as num?)?.toInt(),
      subCategoryList: (json['subCategoryList'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MyToolImplToJson(_$MyToolImpl instance) =>
    <String, dynamic>{
      'toolNameKo': instance.toolNameKo,
      'toolType': _$ToolTypeEnumMap[instance.toolType]!,
      'idx': instance.idx,
      'subCategoryIdx': instance.subCategoryIdx,
      'subCategoryList': instance.subCategoryList,
    };

const _$ToolTypeEnumMap = {
  ToolType.beauty: 'beauty',
  ToolType.armor: 'armor',
  ToolType.accessory: 'accessory',
  ToolType.color: 'color',
  ToolType.unknown: 'unknown',
  ToolType.favorite: 'favorite',
};
