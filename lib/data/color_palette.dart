enum HairColor {
  red,
  orange,
  yellow,
  green,
  blue,
  purple,
  brown,
  black,
}

enum LensColor {
  red,
  magenta,
  green,
  emerald,
  blue,
  purple,
  brown,
  black,
}

Map<HairColor, List<int>> hairColorPalette = {
  HairColor.red: [0xFFFF6B6B, 1], // 빨강
  HairColor.orange: [0xFFF29727, 2], // 주황
  HairColor.yellow: [0xFFFFD93D, 3], // 노랑
  HairColor.green: [0xFF6BCB77, 4], // 초록
  HairColor.blue: [0xFF4D96FF, 5], // 파랑
  HairColor.purple: [0xFF845EC2, 6], // 보라
  HairColor.brown: [0xFF644A3A, 7], // 갈색
  HairColor.black: [0xFF000000, 0], // 검정
};

Map<LensColor, List<int>> lensColorPalette = {
  LensColor.red: [0xFFFF6B6B, 2], // 빨강
  LensColor.magenta: [0xFFFF58B9, 7], // 자수정
  LensColor.green: [0xFF6BCB77, 3], // 초록
  LensColor.emerald: [0xFF89FFDE, 5], // 에메랄드
  LensColor.blue: [0xFF4D96FF, 1], // 파랑
  LensColor.purple: [0xFF845EC2, 6], // 보라
  LensColor.brown: [0xFF644A3A, 4], // 갈색
  LensColor.black: [0xFF000000, 0], // 검정
};
