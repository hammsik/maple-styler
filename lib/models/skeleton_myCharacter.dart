class MyCharacter {
  // 뷰티
  String hair;
  String face;
  String head;
  String body;
  // 장비
  String top;
  String bottom;
  String? hat;
  String? overall;
  String? cash;
  String? cape;
  String? glove;
  String? shoes;
  String? shield;

  MyCharacter({
    this.hair = '68090',
    this.face = '50137',
    this.head = '12016',
    this.body = '2016',
    this.hat,
    this.overall,
    this.cash,
    this.top = '1040036',
    this.bottom = '1060026',
    this.cape,
    this.glove,
    this.shoes,
    this.shield,
  });

  void setMyCharacter({required String subCategory, required String itemId}) {
    switch (subCategory) {
      case 'Hair':
        hair = itemId;
        break;
      case 'Face':
        face = itemId;
        break;
      case 'Head':
        head = itemId;
        body = itemId.substring(1);
        break;
      case 'Top':
        top = itemId;
        break;
      case 'Bottom':
        bottom = itemId;
        break;
      case 'Overall':
        overall = itemId;
        break;
      case 'Cash':
        cash = itemId;
        break;
      case 'Cape':
        cape = itemId;
        break;
      case 'Gloove':
        glove = itemId;
        break;
      case 'Shoes':
        shoes = itemId;
        break;
      default:
        shield = itemId;
    }
  }

  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"1157","region":"KMST","animationName":"default"},';
  }

  String makeItemsURL() {
    String items = "";
    items += addVersionAndRegion(hair);
    items += addVersionAndRegion(face);
    items += addVersionAndRegion(head.substring(1));
    items += addVersionAndRegion(head);
    if (hat != null) {
      items += addVersionAndRegion(hat!);
    }
    if (overall == null) {
      items += addVersionAndRegion(top);
      items += addVersionAndRegion(bottom);
    } else {
      items += addVersionAndRegion(overall!);
    }
    if (cash != null) {
      items += addVersionAndRegion(cash!);
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
