import 'package:flutter/material.dart';
import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

enum ImageType {
  stand,
  standGif,
  walkGif,
}

@Riverpod(keepAlive: true)
class ImageSetting extends _$ImageSetting {
  @override
  ImageType build() {
    return ImageType.walkGif;
  }

  void changeImageType(ImageType type) {
    state = type;
  }
}

@Riverpod(keepAlive: true)
class ToolMap extends _$ToolMap {
  @override
  Map<ToolType, MyTool> build() {
    return {
      ToolType.beauty: const MyTool(
        toolNameKo: '뷰티',
        toolType: ToolType.beauty,
        currentSubcategoryType: SubCategoryType.hair,
        subCategoryMap: {
          SubCategoryType.hair: SubCategory(
              nameKo: '헤어', nameEn: 'Hair', type: SubCategoryType.hair),
          SubCategoryType.face: SubCategory(
              nameKo: '성형', nameEn: 'Face', type: SubCategoryType.face),
          SubCategoryType.head: SubCategory(
              nameKo: '피부', nameEn: 'Head', type: SubCategoryType.head),
        },
      ),
      ToolType.armor: const MyTool(
        toolNameKo: '장비',
        toolType: ToolType.armor,
        currentSubcategoryType: SubCategoryType.hat,
        subCategoryMap: {
          SubCategoryType.hat: SubCategory(
              nameKo: '모자', nameEn: 'Hat', type: SubCategoryType.hat),
          SubCategoryType.overall: SubCategory(
              nameKo: '한벌옷', nameEn: 'Overall', type: SubCategoryType.overall),
          SubCategoryType.cash: SubCategory(
              nameKo: '무기', nameEn: 'Cash', type: SubCategoryType.cash),
          SubCategoryType.top: SubCategory(
              nameKo: '상의', nameEn: 'Top', type: SubCategoryType.top),
          SubCategoryType.bottom: SubCategory(
              nameKo: '하의', nameEn: 'Bottom', type: SubCategoryType.bottom),
          SubCategoryType.cape: SubCategory(
              nameKo: '망토', nameEn: 'Cape', type: SubCategoryType.cape),
          SubCategoryType.glove: SubCategory(
              nameKo: '장갑', nameEn: 'Glove', type: SubCategoryType.glove),
          SubCategoryType.shoes: SubCategory(
              nameKo: '신발', nameEn: 'Shoes', type: SubCategoryType.shoes),
          SubCategoryType.shield: SubCategory(
              nameKo: '방패', nameEn: 'Shield', type: SubCategoryType.shield),
        },
      ),
      ToolType.accessory: const MyTool(
        toolNameKo: '악세',
        toolType: ToolType.accessory,
        currentSubcategoryType: SubCategoryType.faceAccessory,
        subCategoryMap: {
          SubCategoryType.faceAccessory: SubCategory(
              nameKo: '얼굴장식',
              nameEn: 'Face Accessory',
              type: SubCategoryType.faceAccessory),
          SubCategoryType.eyeDecoration: SubCategory(
              nameKo: '눈장식',
              nameEn: 'Eye Decoration',
              type: SubCategoryType.eyeDecoration),
          SubCategoryType.earrings: SubCategory(
              nameKo: '귀고리',
              nameEn: 'Earrings',
              type: SubCategoryType.earrings),
        },
      ),
      ToolType.color: const MyTool(
        toolNameKo: '컬러',
        toolType: ToolType.color,
      ),
      ToolType.unknown: const MyTool(
        toolNameKo: '?',
        toolType: ToolType.unknown,
      ),
      ToolType.favorite: const MyTool(
        toolNameKo: '찜',
        toolType: ToolType.favorite,
      ),
    };
  }

  void changeSubcategory(
      {required ToolType toolType, required SubCategoryType subCategoryType}) {
    state = {
      ...state,
      toolType:
          state[toolType]!.copyWith(currentSubcategoryType: subCategoryType)
    };
    ref
        .read(toolTypeSettingProvider.notifier)
        .changeCurrentTool(type: toolType);
  }
}

@Riverpod(keepAlive: true)
class ToolTypeSetting extends _$ToolTypeSetting {
  @override
  ToolType build() {
    return ToolType.beauty;
  }

  void changeCurrentTool({required ToolType type}) {
    state = type;
  }
}
