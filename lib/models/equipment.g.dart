// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentImpl _$$EquipmentImplFromJson(Map<String, dynamic> json) =>
    _$EquipmentImpl(
      hairColor1: json['hairColor1'] as String,
      hairColor2: json['hairColor2'] as String,
      lensColor1: json['lensColor1'] as String,
      lensColor2: json['lensColor2'] as String,
      hair: json['hair'] == null
          ? const Item(id: '68090', name: '허쉬 헤어')
          : Item.fromJson(json['hair'] as Map<String, dynamic>),
      face: json['face'] == null
          ? const Item(id: '50137', name: '차차 얼굴')
          : Item.fromJson(json['face'] as Map<String, dynamic>),
      head: Item.fromJson(json['head'] as Map<String, dynamic>),
      hat: json['hat'] == null
          ? null
          : Item.fromJson(json['hat'] as Map<String, dynamic>),
      overAll: json['overAll'] == null
          ? null
          : Item.fromJson(json['overAll'] as Map<String, dynamic>),
      cash: json['cash'] == null
          ? null
          : Item.fromJson(json['cash'] as Map<String, dynamic>),
      top: json['top'] == null
          ? null
          : Item.fromJson(json['top'] as Map<String, dynamic>),
      bottom: json['bottom'] == null
          ? null
          : Item.fromJson(json['bottom'] as Map<String, dynamic>),
      cape: json['cape'] == null
          ? null
          : Item.fromJson(json['cape'] as Map<String, dynamic>),
      glove: json['glove'] == null
          ? null
          : Item.fromJson(json['glove'] as Map<String, dynamic>),
      shoes: json['shoes'] == null
          ? null
          : Item.fromJson(json['shoes'] as Map<String, dynamic>),
      shield: json['shield'] == null
          ? null
          : Item.fromJson(json['shield'] as Map<String, dynamic>),
      faceAccessory: json['faceAccessory'] == null
          ? null
          : Item.fromJson(json['faceAccessory'] as Map<String, dynamic>),
      eyeDecoration: json['eyeDecoration'] == null
          ? null
          : Item.fromJson(json['eyeDecoration'] as Map<String, dynamic>),
      earrings: json['earrings'] == null
          ? null
          : Item.fromJson(json['earrings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EquipmentImplToJson(_$EquipmentImpl instance) =>
    <String, dynamic>{
      'hairColor1': instance.hairColor1,
      'hairColor2': instance.hairColor2,
      'lensColor1': instance.lensColor1,
      'lensColor2': instance.lensColor2,
      'hair': instance.hair,
      'face': instance.face,
      'head': instance.head,
      'hat': instance.hat,
      'overAll': instance.overAll,
      'cash': instance.cash,
      'top': instance.top,
      'bottom': instance.bottom,
      'cape': instance.cape,
      'glove': instance.glove,
      'shoes': instance.shoes,
      'shield': instance.shield,
      'faceAccessory': instance.faceAccessory,
      'eyeDecoration': instance.eyeDecoration,
      'earrings': instance.earrings,
    };
