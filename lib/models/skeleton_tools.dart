enum ToolType {
  beauty,
  armor,
  accessory,
  color,
  unknown,
  favorite,
}

enum SubCategoryType {
  hair,
  face,
  head,
  hat,
  overall,
  cash,
  top,
  bottom,
  cape,
  glove,
  shoes,
  shield,
  faceAccessory,
  eyeDecoration,
  earrings,
}

class MyTool {
  final String toolNameKo;
  final ToolType toolType;
  final int idx;
  final int? cntIdx;
  List<SubCategory>? subCategoryList;

  MyTool({
    required this.toolNameKo,
    required this.toolType,
    required this.idx,
    this.cntIdx,
    this.subCategoryList,
  });
}

class SubCategory {
  final String nameKo;
  final String nameEn;
  final SubCategoryType type;

  const SubCategory({
    required this.nameKo,
    required this.nameEn,
    required this.type,
  });
}
