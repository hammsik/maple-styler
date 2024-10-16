// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      prism: json['prism'] == null
          ? null
          : Prism.fromJson(json['prism'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'prism': instance.prism,
    };

_$PrismImpl _$$PrismImplFromJson(Map<String, dynamic> json) => _$PrismImpl(
      hue: json['hue'] as String?,
      saturation: json['saturation'] as String?,
      contrast: json['contrast'] as String?,
      brightness: json['brightness'] as String?,
    );

Map<String, dynamic> _$$PrismImplToJson(_$PrismImpl instance) =>
    <String, dynamic>{
      'hue': instance.hue,
      'saturation': instance.saturation,
      'contrast': instance.contrast,
      'brightness': instance.brightness,
    };
