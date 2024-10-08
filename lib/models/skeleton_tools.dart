enum ToolType {
  beauty,
  armor,
  accessory,
  color,
  unknown,
  favorite,
}

enum SubCategory {
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
  final bool isNeedMenu;
  List<List<String>>? menuList;

  MyTool({
    required this.toolNameKo,
    required this.toolType,
    required this.idx,
    this.cntIdx,
    required this.isNeedMenu,
    this.menuList,
  });
}
