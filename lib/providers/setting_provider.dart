import 'package:maple_closet/models/tool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

enum ActionType {
  stand1,
  _stand1,
  _stand2,
  _walk1,
  _walk2,
  _swingO1,
  _alert,
  _fly,
  jump,
  prone,
  sit,
}

Map<ActionType, String> actionMap = {
  ActionType.stand1: '기본',
  ActionType._stand1: '기본',
  ActionType._walk1: '걷기',
  ActionType._swingO1: '공격',
  ActionType._alert: '피격',
  ActionType._fly: '비행',
  ActionType.jump: '점프',
  ActionType.prone: '엎드리기',
  ActionType.sit: '앉기',
};

enum BackgroundType {
  basic,
  henesis,
  kerningcity,
  arcana,
  sernium,
}

@Riverpod(keepAlive: true)
class ActionSetting extends _$ActionSetting {
  @override
  ActionType build() {
    return ActionType.stand1;
  }

  void changeActionType(ActionType type) {
    state = type;
  }
}

@Riverpod(keepAlive: true)
class BackgroundSetting extends _$BackgroundSetting {
  @override
  BackgroundType build() {
    return BackgroundType.basic;
  }

  void changeBackground({required BackgroundType type}) {
    if (type != BackgroundType.basic) {
      ref
          .read(actionSettingProvider.notifier)
          .changeActionType(ActionType.stand1);
    }
    state = type;
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
      ToolType.weapon: const MyTool(
          toolNameKo: '무기',
          toolType: ToolType.weapon,
          currentSubcategoryType: SubCategoryType.cash,
          subCategoryMap: {
            SubCategoryType.cash: SubCategory(
                nameKo: '캐시무기', nameEn: 'Cash', type: SubCategoryType.cash),
            SubCategoryType.oneHanded: SubCategory(
              nameKo: '한손무기',
              nameEn: 'oneHanded',
              type: SubCategoryType.oneHanded,
              currentWeaponCategoryType: WeaponCategoryType.oneSword,
            ),
            SubCategoryType.twoHanded: SubCategory(
              nameKo: '두손무기',
              nameEn: 'twoHanded',
              type: SubCategoryType.twoHanded,
              currentWeaponCategoryType: WeaponCategoryType.twoSword,
            ),
          }),
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
