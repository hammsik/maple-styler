import 'package:maple_closet/models/tool.dart';

Map<ToolType, MyTool> toolMap = {
  ToolType.beauty: const MyTool(
    idx: 0,
    toolNameKo: '뷰티',
    toolType: ToolType.beauty,
    subCategoryIdx: 0,
    subCategoryList: [
      SubCategory(nameKo: '헤어', nameEn: 'Hair', type: SubCategoryType.hair),
      SubCategory(nameKo: '성형', nameEn: 'Face', type: SubCategoryType.face),
      SubCategory(nameKo: '피부', nameEn: 'Head', type: SubCategoryType.head),
    ],
  ),
  ToolType.armor: const MyTool(
    idx: 1,
    toolNameKo: '장비',
    toolType: ToolType.armor,
    subCategoryIdx: 0,
    subCategoryList: [
      SubCategory(nameKo: '모자', nameEn: 'Hat', type: SubCategoryType.hat),
      SubCategory(
          nameKo: '한벌옷', nameEn: 'Overall', type: SubCategoryType.overall),
      SubCategory(nameKo: '무기', nameEn: 'Cash', type: SubCategoryType.cash),
      SubCategory(nameKo: '상의', nameEn: 'Top', type: SubCategoryType.top),
      SubCategory(nameKo: '하의', nameEn: 'Bottom', type: SubCategoryType.bottom),
      SubCategory(nameKo: '망토', nameEn: 'Cape', type: SubCategoryType.cape),
      SubCategory(nameKo: '장갑', nameEn: 'Glove', type: SubCategoryType.glove),
      SubCategory(nameKo: '신발', nameEn: 'Shoes', type: SubCategoryType.shoes),
      SubCategory(nameKo: '방패', nameEn: 'Shield', type: SubCategoryType.shield),
    ],
  ),
  ToolType.accessory: const MyTool(
    idx: 2,
    toolNameKo: '악세',
    toolType: ToolType.accessory,
    subCategoryIdx: 0,
    subCategoryList: [
      SubCategory(
          nameKo: '얼굴장식',
          nameEn: 'Face Accessory',
          type: SubCategoryType.faceAccessory),
      SubCategory(
          nameKo: '눈장식',
          nameEn: 'Eye Decoration',
          type: SubCategoryType.eyeDecoration),
      SubCategory(
          nameKo: '귀고리', nameEn: 'Earrings', type: SubCategoryType.earrings),
    ],
  ),
  ToolType.color: const MyTool(
    idx: 3,
    toolNameKo: '컬러',
    toolType: ToolType.color,
  ),
  ToolType.unknown: const MyTool(
    idx: 4,
    toolNameKo: '?',
    toolType: ToolType.unknown,
  ),
  ToolType.favorite: const MyTool(
    idx: 5,
    toolNameKo: '찜',
    toolType: ToolType.favorite,
  ),
};
