// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actionSettingHash() => r'13bd0f1f3d612cea3120510d19cf5d20ad4ef34b';

/// See also [ActionSetting].
@ProviderFor(ActionSetting)
final actionSettingProvider =
    NotifierProvider<ActionSetting, ActionType>.internal(
  ActionSetting.new,
  name: r'actionSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$actionSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActionSetting = Notifier<ActionType>;
String _$backgroundSettingHash() => r'b469a6ad6609884116ac8504b19920cadffc9835';

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
String _$toolMapHash() => r'5e3bf7e64cd2ab74e69b5e695e548112dca6a0ec';

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
