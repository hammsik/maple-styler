import 'dart:collection';
import 'dart:convert';

class MyCharacter {
  late Queue<String> itemQueue;
  late int itemQueueIdx;
  late Map<String, dynamic> itemMap;

  MyCharacter() {
    itemQueue = DoubleLinkedQueue();
    itemQueueIdx = 0;
    itemMap = {
      //뷰티
      'Hair': ['68090', '허쉬 헤어', '0'],
      'Face': ['50137', '차차 얼굴', '0'],
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

    addItem();
  }

  void setHairColor(String hairColor) {
    itemMap['Hair'][2] = hairColor;
    itemMap['Hair'][0] = itemMap['Hair'][0].replaceRange(4, 5, hairColor);

    addItem();
  }

  void setLensColor(String lensColor) {
    itemMap['Face'][2] = lensColor;
    itemMap['Face'][0] = itemMap['Face'][0].replaceRange(2, 3, lensColor);

    addItem();
  }

  void updateMyCharacter(
      {required String subCategory,
      required String itemId,
      required String itemName}) {
    if (subCategory == 'Head') {
      itemMap['Head'][0] = itemId;
      itemMap['Head'][1] = itemName;
      itemMap['Body'][0] = itemId.substring(1);
      itemMap['Body'][1] = itemName.substring(1);
    } else if (subCategory == 'Overall') {
      itemMap['Overall'][0] = itemId;
      itemMap['Overall'][1] = itemName;
      itemMap['Top'][0] = '1040036';
      itemMap['Top'][1] = '상의 이너';
      itemMap['Bottom'][0] = '1060026';
      itemMap['Bottom'][1] = '하의 이너';
    } else if (subCategory == 'Top') {
      itemMap['Top'][0] = itemId;
      itemMap['Top'][1] = itemName;
      itemMap['Overall'][0] = 'null';
      itemMap['Overall'][1] = 'null';
    } else if (subCategory == 'Bottom') {
      itemMap['Bottom'][0] = itemId;
      itemMap['Bottom'][1] = itemName;
      itemMap['Overall'][0] = 'null';
      itemMap['Overall'][1] = 'null';
    } else {
      if (subCategory == 'Hair') {
        itemMap['Hair'][0] = itemId.replaceRange(4, 5, itemMap['Hair'][2]);
      } else if (subCategory == 'Face') {
        itemMap['Face'][0] = itemId.replaceRange(2, 3, itemMap['Face'][2]);
      } else {
        itemMap[subCategory][0] = itemId;
      }
      itemMap[subCategory][1] = itemName;
    }

    addItem();
  }

  void takeOffItem({required String subCategory}) {
    if (subCategory == 'Top') {
      itemMap['Top']![0] = '1040036';
    } else if (subCategory == 'Bottom') {
      itemMap['Bottom']![0] = '1060026';
    } else {
      itemMap[subCategory]![0] = 'null';
      itemMap[subCategory]![1] = 'null';
    }

    addItem();
  }

  String addVersionAndRegion(String item) {
    return '{"itemId":$item, "version":"389","region":"KMS"},';
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

  void addItem() {
    if (itemQueueIdx < itemQueue.length - 1) {
      int previousLength = itemQueue.length;
      for (int i = itemQueueIdx + 1; i < previousLength; i++) {
        itemQueue.removeLast();
      }
    }

    itemQueue.add(json.encode(itemMap));

    if (itemQueue.length > 5) {
      itemQueue.removeFirst();
    }

    itemQueueIdx = itemQueue.length - 1;
  }

  String getMyCharacter({String characterItemsURL = ''}) {
    return 'https://maplestory.io/api/Character/${characterItemsURL == '' ? makeItemsURL() : characterItemsURL}/stand1/0/?renderMode=2';
  }

  void undo() {
    itemMap = json.decode(itemQueue.elementAt(--itemQueueIdx));
  }

  void redo() {
    itemMap = json.decode(itemQueue.elementAt(++itemQueueIdx));
  }
}
