// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageSettingHash() => r'212a94c32405a2cd1c606d0c0cf26590bf4aa3ef';

/// See also [ImageSetting].
@ProviderFor(ImageSetting)
final imageSettingProvider = NotifierProvider<ImageSetting, ImageType>.internal(
  ImageSetting.new,
  name: r'imageSettingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$imageSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ImageSetting = Notifier<ImageType>;
String _$toolMapHash() => r'ecd0e22b690c5b85750aacd3f3932e02c6e6a010';

/// See also [ToolMap].
@ProviderFor(ToolMap)
final toolMapProvider =
    NotifierProvider<ToolMap, Map<ToolType, MyTool>>.internal(
  ToolMap.new,
  name: r'toolMapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$toolMapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToolMap = Notifier<Map<ToolType, MyTool>>;
String _$toolTypeSettingHash() => r'894a249f97e4560e5de4d4874d4af873bfa4e816';

/// See also [ToolTypeSetting].
@ProviderFor(ToolTypeSetting)
final toolTypeSettingProvider =
    NotifierProvider<ToolTypeSetting, ToolType>.internal(
  ToolTypeSetting.new,
  name: r'toolTypeSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$toolTypeSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToolTypeSetting = Notifier<ToolType>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
