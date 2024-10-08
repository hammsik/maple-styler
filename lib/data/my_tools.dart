import 'package:maple_closet/models/skeleton_tools.dart';

List<MyTool> myToolList = [
  MyTool(
    idx: 0,
    cntIdx: 0,
    toolNameKo: '뷰티',
    toolType: ToolType.beauty,
    isNeedMenu: true,
    menuList: [
      ['헤어', 'Hair'],
      ['성형', 'Face'],
      ['피부', 'Head']
    ],
  ),
  MyTool(
    idx: 1,
    cntIdx: 3,
    toolNameKo: '장비',
    toolType: ToolType.armor,
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
    ],
  ),
  MyTool(
    idx: 2,
    cntIdx: 12,
    toolNameKo: '악세',
    toolType: ToolType.accessory,
    isNeedMenu: true,
    menuList: [
      ['얼굴장식', 'Face Accessory'],
      ['눈장식', 'Eye Decoration'],
      ['귀고리', 'Earrings']
    ],
  ),
  MyTool(
    idx: 3,
    toolNameKo: '컬러',
    toolType: ToolType.color,
    isNeedMenu: false,
  ),
  MyTool(
    idx: 4,
    toolNameKo: '?',
    toolType: ToolType.unknown,
    isNeedMenu: false,
  ),
  MyTool(
    idx: 5,
    toolNameKo: '찜',
    toolType: ToolType.favorite,
    isNeedMenu: false,
  ),
];
