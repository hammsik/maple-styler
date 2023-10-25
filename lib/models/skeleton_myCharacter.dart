class MyCharacter {
  // 뷰티
  final String? skinColor;
  final String? hair;
  final String? face;
  // 장비
  final String? weapon;
  final String? overall;
  final String? hat;
  final String? top;
  final String? bottom;
  final String? cape;
  final String? glove;
  final String? shoes;
  final String? shield;

  MyCharacter(
      {this.skinColor,
      this.hair,
      this.face,
      this.weapon,
      this.overall,
      this.hat,
      this.top,
      this.bottom,
      this.cape,
      this.glove,
      this.shoes,
      this.shield});

  String addVersionAndRegion(String item) {
    return '{"itemId":${item}, "version":"1157","region":"KMST","animationName":"default"},';
  }

  String makeItemsURL() {
    String items = "";
    if (skinColor != null) {
      items += addVersionAndRegion(skinColor!.substring(1));
      items += addVersionAndRegion(skinColor!);
    } else {
      items += addVersionAndRegion('2016');
      items += addVersionAndRegion('12016');
    }
    if (hair != null) {
      items += addVersionAndRegion(hair!);
    } else {
      items += addVersionAndRegion('68090');
    }
    if (face != null) {
      items += addVersionAndRegion(face!);
    } else {
      items += addVersionAndRegion('50137');
    }
    if (top != null) {
      items += addVersionAndRegion(top!);
    } else if (overall == null) {
      items += addVersionAndRegion('1040036');
    }
    if (bottom != null) {
      items += addVersionAndRegion(bottom!);
    } else if (overall == null) {
      items += addVersionAndRegion('1060026');
    }
    if (weapon != null) {
      items += addVersionAndRegion(weapon!);
    }
    if (overall != null) {
      items += addVersionAndRegion(overall!);
    }
    if (hat != null) {
      items += addVersionAndRegion(hat!);
    }
    if (cape != null) {
      items += addVersionAndRegion(cape!);
    }
    if (glove != null) {
      items += addVersionAndRegion(glove!);
    }
    if (shoes != null) {
      items += addVersionAndRegion(shoes!);
    }
    if (shield != null) {
      items += addVersionAndRegion(shield!);
    }

    return items;
  }

  String getMyCharacterURL() {
    String middle = makeItemsURL();
    return 'https://maplestory.io/api/Character/$middle/stand1/0/?renderMode=2';
  }
}
  // final String head = 'https://maplestory.io/api/Character/';
  // const String tail = '/stand1/0/?renderMode=2';
