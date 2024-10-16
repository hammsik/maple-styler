import 'package:maple_closet/models/skeleton_tools.dart';

List<MyTool> myToolList = [
  MyTool(
    idx: 0,
    cntIdx: 0,
    toolNameKo: '뷰티',
    toolType: ToolType.beauty,
    subCategoryList: [
      const SubCategory(
          nameKo: '헤어', nameEn: 'Hair', type: SubCategoryType.hair),
      const SubCategory(
          nameKo: '성형', nameEn: 'Face', type: SubCategoryType.face),
      const SubCategory(
          nameKo: '피부', nameEn: 'Head', type: SubCategoryType.head),
    ],
  ),
  MyTool(
    idx: 1,
    cntIdx: 3,
    toolNameKo: '장비',
    toolType: ToolType.armor,
    subCategoryList: [
      const SubCategory(nameKo: '모자', nameEn: 'Hat', type: SubCategoryType.hat),
      const SubCategory(
          nameKo: '한벌옷', nameEn: 'Overall', type: SubCategoryType.overall),
      const SubCategory(
          nameKo: '무기', nameEn: 'Cash', type: SubCategoryType.cash),
      const SubCategory(nameKo: '상의', nameEn: 'Top', type: SubCategoryType.top),
      const SubCategory(
          nameKo: '하의', nameEn: 'Bottom', type: SubCategoryType.bottom),
      const SubCategory(
          nameKo: '망토', nameEn: 'Cape', type: SubCategoryType.cape),
      const SubCategory(
          nameKo: '장갑', nameEn: 'Glove', type: SubCategoryType.glove),
      const SubCategory(
          nameKo: '신발', nameEn: 'Shoes', type: SubCategoryType.shoes),
      const SubCategory(
          nameKo: '방패', nameEn: 'Shield', type: SubCategoryType.shield),
    ],
  ),
  MyTool(
    idx: 2,
    cntIdx: 12,
    toolNameKo: '악세',
    toolType: ToolType.accessory,
    subCategoryList: [
      const SubCategory(
          nameKo: '얼굴장식',
          nameEn: 'Face Accessory',
          type: SubCategoryType.faceAccessory),
      const SubCategory(
          nameKo: '눈장식',
          nameEn: 'Eye Decoration',
          type: SubCategoryType.eyeDecoration),
      const SubCategory(
          nameKo: '귀고리', nameEn: 'Earrings', type: SubCategoryType.earrings),
    ],
  ),
  MyTool(
    idx: 3,
    toolNameKo: '컬러',
    toolType: ToolType.color,
  ),
  MyTool(
    idx: 4,
    toolNameKo: '?',
    toolType: ToolType.unknown,
  ),
  MyTool(
    idx: 5,
    toolNameKo: '찜',
    toolType: ToolType.favorite,
  ),
];
