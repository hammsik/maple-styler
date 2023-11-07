class MyTool {
  final String toolName_ko;
  final String? toolName_en;
  final int idx;
  final int? cntIdx;
  final bool isNeedMenu;
  List<List<String>>? menuList;

  MyTool(
      {required this.toolName_ko,
      required this.idx,
      this.cntIdx,
      required this.isNeedMenu,
      this.toolName_en,
      this.menuList});
}
