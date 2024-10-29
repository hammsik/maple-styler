// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapleItemListHash() => r'af5fedb11dc84abe0acb0b3ecb20b9d7f4bb2a46';

/// See also [MapleItemList].
@ProviderFor(MapleItemList)
final mapleItemListProvider = AsyncNotifierProvider<MapleItemList,
    Map<ToolType, Map<SubCategoryType, List<Item>>>>.internal(
  MapleItemList.new,
  name: r'mapleItemListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$mapleItemListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapleItemList
    = AsyncNotifier<Map<ToolType, Map<SubCategoryType, List<Item>>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
