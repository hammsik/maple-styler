// ignore: file_names
import 'package:maple_closet/models/skeleton_tools.dart';

List<MyTool> myToolList = [
  MyTool(
      idx: 0,
      cntIdx: 0,
      toolName_ko: '뷰티',
      toolName_en: 'Character',
      isNeedMenu: true,
      menuList: [
        ['헤어', 'Hair'],
        ['성형', 'Face'],
        ['피부', 'Head']
      ]),
  MyTool(
      idx: 1,
      cntIdx: 3,
      toolName_ko: '장비',
      toolName_en: 'Armor',
      isNeedMenu: true,
      menuList: [
        ['모자', 'Hat'],
        ['한벌옷', 'Overall'],
        ['무기', 'Cash'],
        ['상의', 'Top'],
        ['하의', 'Bottom'],
        ['망토', 'Cape'],
        ['장갑', 'Glove'],
        ['신발', 'Shoes'],
        ['방패', 'Shield']
      ]),
  MyTool(
      idx: 2,
      cntIdx: 12,
      toolName_ko: '악세',
      toolName_en: 'Accessory',
      isNeedMenu: true,
      menuList: [
        ['얼굴장식', 'Face Accessory'],
        ['눈장식', 'Eye Decoration'],
        ['귀고리', 'Earrings']
      ]),
  MyTool(idx: 3, toolName_ko: '컬러', isNeedMenu: false),
  MyTool(idx: 4, toolName_ko: '?', isNeedMenu: false),
  MyTool(idx: 5, toolName_ko: '찜', isNeedMenu: false),
];
