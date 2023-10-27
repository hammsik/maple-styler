class MyCharacter {
  Map<String, List<String>> itemMap = {
    //뷰티
    'Hair': ['68090', '검은색 허쉬 헤어'],
    'Face': ['50137', '차차 얼굴'],
    'Head': ['12016', '홍조 꽃잎 피부'],
    'Body': ['2016', 'null'],
    //장비
    'Hat': ['null', 'null'],
    'Overall': ['null', 'null'],
    'Cash': ['null', 'null'],
    'Top': ['1040036', '상의 이너'],
    'Bottom': ['1060026', '하의 이너'],
    'Cape': ['null', 'null'],
    'Glove': ['null', 'null'],
    'Shoes': ['null', 'null'],
    'Shield': ['null', 'null'],
    //악세
    'Face Accessory': ['null', 'null'],
    'Eye Decoration': ['null', 'null'],
    'Earrings': ['null', 'null'],
  };
  // // 뷰티
  // String hair = '68090';
  // String face = '50137';
  // String head = '12016';
  // String body = '2016';
  // // 장비
  // String top = '1040036';
  // String bottom = '1060026';
  // String? hat;
  // String? overall;
  // String? cash;
  // String? cape;
  // String? glove;
  // String? shoes;
  // String? shield;
  // //악세
  // String? faceAccessory;
  // String? eyeDecoration;
  // String? earrings;

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

  void setMyCharacter(
      {required String subCategory,
      required String itemId,
      required String itemName}) {
    switch (subCategory) {
      case 'Hair':
        itemMap['Hair']![0] = itemId;
        itemMap['Hair']![1] = itemName;
        break;
      case 'Face':
        itemMap['Face']![0] = itemId;
        itemMap['Face']![1] = itemName;
        break;
      case 'Head':
        itemMap['Head']![0] = itemId;
        itemMap['Body']![0] = itemId.substring(1);
        itemMap['Head']![1] = itemName;
        itemMap['Body']![1] = itemName.substring(1);
        break;
      case 'Hat':
        itemMap['Hat']![0] = itemId;
        itemMap['Hat']![1] = itemName;
        break;
      case 'Overall':
        itemMap['Overall']![0] = itemId;
        itemMap['Top']![0] = '1040036';
        itemMap['Bottom']![0] = '1060026';
        itemMap['Overall']![1] = itemName;
        itemMap['Top']![1] = '상의 이너';
        itemMap['Bottom']![1] = '하의 이너';
        break;
      case 'Cash':
        itemMap['Cash']![0] = itemId;
        itemMap['Cash']![1] = itemName;
        break;
      case 'Top':
        itemMap['Top']![0] = itemId;
        itemMap['Overall']![0] = 'null';
        itemMap['Top']![1] = itemName;
        itemMap['Overall']![1] = 'null';
        break;
      case 'Bottom':
        itemMap['Bottom']![0] = itemId;
        itemMap['Overall']![0] = 'null';
        itemMap['Bottom']![1] = itemName;
        itemMap['Overall']![1] = 'null';
        break;
      case 'Cape':
        itemMap['Cape']![0] = itemId;
        itemMap['Cape']![1] = itemName;
        break;
      case 'Gloove':
        itemMap['Gloove']![0] = itemId;
        itemMap['Gloove']![1] = itemName;
        break;
      case 'Shoes':
        itemMap['Shoes']![0] = itemId;
        itemMap['Shoes']![1] = itemName;
        break;
      case 'Shield':
        itemMap['Shield']![0] = itemId;
        itemMap['Shield']![1] = itemName;
        break;
      case 'Face Accessory':
        itemMap['Face Accessory']![0] = itemId;
        itemMap['Face Accessory']![1] = itemName;
        break;
      case 'Eye Decoration':
        itemMap['Eye Decoration']![0] = itemId;
        itemMap['Eye Decoration']![1] = itemName;
        break;
      default:
        itemMap['Earrings']![0] = itemId;
        itemMap['Earrings']![1] = itemName;
    }
  }

  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"1157","region":"KMST","animationName":"default"},';
  }

  String makeItemsURL() {
    String items = "";
    items += addVersionAndRegion(itemMap['Hair']![0]);
    items += addVersionAndRegion(itemMap['Face']![0]);
    items += addVersionAndRegion(itemMap['Body']![0]);
    items += addVersionAndRegion(itemMap['Head']![0]);
    if (itemMap['Hat']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Hat']![0]);
    }
    if (itemMap['Overall']![0] == 'null') {
      items += addVersionAndRegion(itemMap['Top']![0]);
      items += addVersionAndRegion(itemMap['Bottom']![0]);
    } else {
      items += addVersionAndRegion(itemMap['Overall']![0]);
    }
    if (itemMap['Cash']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Cash']![0]);
    }
    if (itemMap['Cape']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Cape']![0]);
    }
    if (itemMap['Glove']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Glove']![0]);
    }
    if (itemMap['Shoes']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Shoes']![0]);
    }
    if (itemMap['Shield']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Shield']![0]);
    }
    if (itemMap['Face Accessory']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Face Accessory']![0]);
    }
    if (itemMap['Eye Decoration']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Eye Decoration']![0]);
    }
    if (itemMap['Earrings']![0] != 'null') {
      items += addVersionAndRegion(itemMap['Earrings']![0]);
    }

    return items;
  }

  String getMyCharacterURL() {
    String middle = makeItemsURL();
    return 'https://maplestory.io/api/Character/$middle/stand1/0/?renderMode=2';
  }
}
