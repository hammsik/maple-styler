import 'package:flutter/src/material/menu_anchor.dart';

class MyTool {
  final String toolName;
  final int idx;
  final bool isNeedMenu;
  List<String>? menuList;

  MyTool(
      {required this.toolName,
      required this.idx,
      required this.isNeedMenu,
      this.menuList});
}
