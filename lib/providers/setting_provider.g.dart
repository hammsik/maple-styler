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
String _$backgroundSettingHash() => r'0f0c2fdde612a5536b2cba42b813a6b591b5a868';

/// See also [BackgroundSetting].
@ProviderFor(BackgroundSetting)
final backgroundSettingProvider =
    NotifierProvider<BackgroundSetting, BackgroundType>.internal(
  BackgroundSetting.new,
  name: r'backgroundSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$backgroundSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BackgroundSetting = Notifier<BackgroundType>;
String _$toolTypeSettingHash() => r'c12a667b046e624d84561be69cec6c849dda5af7';

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
String _$toolMapHash() => r'aeeadced04ae828e09791e4b599f632d5ed69e08';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
