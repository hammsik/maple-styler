// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemMapImpl _$$ItemMapImplFromJson(Map<String, dynamic> json) =>
    _$ItemMapImpl(
      hair: json['hair'] == null
          ? null
          : Item.fromJson(json['hair'] as Map<String, dynamic>),
      face: json['face'] == null
          ? null
          : Item.fromJson(json['face'] as Map<String, dynamic>),
      head: Item.fromJson(json['head'] as Map<String, dynamic>),
      body: Item.fromJson(json['body'] as Map<String, dynamic>),
      hat: json['hat'] == null
          ? null
          : Item.fromJson(json['hat'] as Map<String, dynamic>),
      overrAll: json['overrAll'] == null
          ? null
          : Item.fromJson(json['overrAll'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$ItemMapImplToJson(_$ItemMapImpl instance) =>
    <String, dynamic>{
      'hair': instance.hair,
      'face': instance.face,
      'head': instance.head,
      'body': instance.body,
      'hat': instance.hat,
      'overrAll': instance.overrAll,
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
