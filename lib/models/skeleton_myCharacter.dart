class MyCharacter {
  // 뷰티
  String hair = '68090';
  String face = '50137';
  String head = '12016';
  String body = '2016';
  // 장비
  String top = '1040036';
  String bottom = '1060026';
  String? hat;
  String? overall;
  String? cash;
  String? cape;
  String? glove;
  String? shoes;
  String? shield;
  //악세
  String? faceAccessory;
  String? eyeDecoration;
  String? earrings;

  // MyCharacter({
  //   this.hair = '68090',
  //   this.face = '50137',
  //   this.head = '12016',
  //   this.body = '2016',
  //   this.hat,
  //   this.overall,
  //   this.cash,
  //   this.top = '1040036',
  //   this.bottom = '1060026',
  //   this.cape,
  //   this.glove,
  //   this.shoes,
  //   this.shield,
  //   this.faceAccessory,
  //   this.eyeDecoration,
  //   this.earrings,
  // });

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
      case 'Hat':
        hat = itemId;
        break;
      case 'Overall':
        overall = itemId;
        top = '1040036';
        bottom = '1060026';
        break;
      case 'Cash':
        cash = itemId;
        break;
      case 'Top':
        top = itemId;
        overall = null;
        break;
      case 'Bottom':
        bottom = itemId;
        overall = null;
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
      case 'Shield':
        shield = itemId;
        break;
      case 'Face Accessory':
        faceAccessory = itemId;
        break;
      case 'Eye Decoration':
        eyeDecoration = itemId;
        break;
      default:
        earrings = itemId;
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
    if (faceAccessory != null) {
      items += addVersionAndRegion(faceAccessory!);
    }
    if (eyeDecoration != null) {
      items += addVersionAndRegion(eyeDecoration!);
    }
    if (earrings != null) {
      items += addVersionAndRegion(earrings!);
    }

    return items;
  }

  String getMyCharacterURL() {
    String middle = makeItemsURL();
    return 'https://maplestory.io/api/Character/$middle/stand1/0/?renderMode=2';
  }
}
