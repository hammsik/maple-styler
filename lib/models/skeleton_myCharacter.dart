class MyCharacter {
  Map<String, String> itemMap = {
    //뷰티
    'Hair': '68090',
    'Face': '50137',
    'Head': '12016',
    'Body': '2016',
    //장비
    'Hat': 'null',
    'Overall': 'null',
    'Cash': 'null',
    'Top': '1040036',
    'Bottom': '1060026',
    'Cape': 'null',
    'Glove': 'null',
    'Shoes': 'null',
    'Shield': 'null',
    //악세
    'Face Accessory': 'null',
    'Eye Decoration': 'null',
    'Earrings': 'null',
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

  void setMyCharacter({required String subCategory, required String itemId}) {
    switch (subCategory) {
      case 'Hair':
        itemMap['Hair'] = itemId;
        break;
      case 'Face':
        itemMap['Face'] = itemId;
        break;
      case 'Head':
        itemMap['Head'] = itemId;
        itemMap['Body'] = itemId.substring(1);
        break;
      case 'Hat':
        itemMap['Hat'] = itemId;
        break;
      case 'Overall':
        itemMap['Overall'] = itemId;
        itemMap['Top'] = '1040036';
        itemMap['Bottom'] = '1060026';
        break;
      case 'Cash':
        itemMap['Cash'] = itemId;
        break;
      case 'Top':
        itemMap['Top'] = itemId;
        itemMap['Overall'] = 'null';
        break;
      case 'Bottom':
        itemMap['Bottom'] = itemId;
        itemMap['Overall'] = 'null';
        break;
      case 'Cape':
        itemMap['Cape'] = itemId;
        break;
      case 'Gloove':
        itemMap['Gloove'] = itemId;
        break;
      case 'Shoes':
        itemMap['Shoes'] = itemId;
        break;
      case 'Shield':
        itemMap['Shield'] = itemId;
        break;
      case 'Face Accessory':
        itemMap['Face Accessory'] = itemId;
        break;
      case 'Eye Decoration':
        itemMap['Eye Decoration'] = itemId;
        break;
      default:
        itemMap['Earrings'] = itemId;
    }
  }

  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"1157","region":"KMST","animationName":"default"},';
  }

  String makeItemsURL() {
    String items = "";
    items += addVersionAndRegion(itemMap['Hair']!);
    items += addVersionAndRegion(itemMap['Face']!);
    items += addVersionAndRegion(itemMap['Body']!);
    items += addVersionAndRegion(itemMap['Head']!);
    if (itemMap['Hat'] != 'null') {
      items += addVersionAndRegion(itemMap['Hat']!);
    }
    if (itemMap['Overall'] == 'null') {
      items += addVersionAndRegion(itemMap['Top']!);
      items += addVersionAndRegion(itemMap['Bottom']!);
    } else {
      items += addVersionAndRegion(itemMap['Overall']!);
    }
    if (itemMap['Cash'] != 'null') {
      items += addVersionAndRegion(itemMap['Cash']!);
    }
    if (itemMap['Cape'] != 'null') {
      items += addVersionAndRegion(itemMap['Cape']!);
    }
    if (itemMap['Glove'] != 'null') {
      items += addVersionAndRegion(itemMap['Glove']!);
    }
    if (itemMap['Shoes'] != 'null') {
      items += addVersionAndRegion(itemMap['Shoes']!);
    }
    if (itemMap['Shield'] != 'null') {
      items += addVersionAndRegion(itemMap['Shield']!);
    }
    if (itemMap['Face Accessory'] != 'null') {
      items += addVersionAndRegion(itemMap['Face Accessory']!);
    }
    if (itemMap['Eye Decoration'] != 'null') {
      items += addVersionAndRegion(itemMap['Eye Decoration']!);
    }
    if (itemMap['Earrings'] != 'null') {
      items += addVersionAndRegion(itemMap['Earrings']!);
    }

    return items;
  }

  String getMyCharacterURL() {
    String middle = makeItemsURL();
    return 'https://maplestory.io/api/Character/$middle/stand1/0/?renderMode=2';
  }
}
