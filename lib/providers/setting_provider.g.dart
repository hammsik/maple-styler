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
String _$toolSettingHash() => r'213a83ac7716ab6def4cfa83bb835c701869f581';

/// See also [ToolSetting].
@ProviderFor(ToolSetting)
final toolSettingProvider = NotifierProvider<ToolSetting, MyTool>.internal(
  ToolSetting.new,
  name: r'toolSettingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$toolSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToolSetting = Notifier<MyTool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
