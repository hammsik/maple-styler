import 'package:flutter/src/material/menu_anchor.dart';

class MyTool {
  final String toolName_ko;
  final String? toolName_en;
  final int idx;
  final bool isNeedMenu;
  List<List<String>>? menuList;

  MyTool(
      {required this.toolName_ko,
      required this.idx,
      required this.isNeedMenu,
      this.toolName_en,
      this.menuList});
}
