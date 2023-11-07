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
        ['헤어', 'Hair', '0'],
        ['성형', 'Face', '1'],
        ['피부', 'Head', '2']
      ]),
  MyTool(
      idx: 1,
      cntIdx: 3,
      toolName_ko: '장비',
      toolName_en: 'Armor',
      isNeedMenu: true,
      menuList: [
        ['모자', 'Hat', '0'],
        ['한벌옷', 'Overall', '1'],
        ['무기', 'Cash', '2'],
        ['상의', 'Top', '3'],
        ['하의', 'Bottom', '4'],
        ['망토', 'Cape', '5'],
        ['장갑', 'Glove', '6'],
        ['신발', 'Shoes', '7'],
        ['방패', 'Shield', '8']
      ]),
  MyTool(
      idx: 2,
      cntIdx: 12,
      toolName_ko: '악세',
      toolName_en: 'Accessory',
      isNeedMenu: true,
      menuList: [
        ['얼굴장식', 'Face Accessory', '0'],
        ['눈장식', 'Eye Decoration', '1'],
        ['귀고리', 'Earrings', '2']
      ]),
  MyTool(idx: 3, toolName_ko: '컬러', isNeedMenu: false),
  MyTool(idx: 4, toolName_ko: '다운', isNeedMenu: false),
  MyTool(idx: 5, toolName_ko: '문의', isNeedMenu: false),
];
