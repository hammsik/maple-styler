import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_map_buttons.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';
import 'package:maple_closet/database/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data/backgrounds.dart';

class MapleStyler extends StatefulWidget {
  const MapleStyler({super.key});

  @override
  State<StatefulWidget> createState() => _MapleStyler();
}

class _MapleStyler extends State<MapleStyler> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCharacter dodo = MyCharacter();
  MyCharacter dodo2 = MyCharacter();
  String background = 'normal';
  int currentListButtonIdx = -1;
  List<List<List<dynamic>>> itemList = [];
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    final database = ItemDatabase();
    List<List<CharacterItem>> characterItemList = [];
    List<List<ArmorItem>> armorItemList = [];
    List<List<AccessoryItem>> accessoryItemList = [];

    for (int characterSubCategory = 0;
        characterSubCategory < myToolList[0].menuList!.length;
        characterSubCategory++) {
      characterItemList.add(List.from((await (database
                  .select(database.characterItems)
                ..where((item) => item.subCategory
                    .equals(myToolList[0].menuList![characterSubCategory][1])))
              .get())
          .reversed));
    }
    for (int armorSubCategory = 0;
        armorSubCategory < myToolList[1].menuList!.length;
        armorSubCategory++) {
      armorItemList.add(List.from((await (database.select(database.armorItems)
                ..where((item) => item.subCategory
                    .equals(myToolList[1].menuList![armorSubCategory][1])))
              .get())
          .reversed));
    }
    for (int accessorySubCategory = 0;
        accessorySubCategory < myToolList[2].menuList!.length;
        accessorySubCategory++) {
      accessoryItemList.add(List.from((await (database
                  .select(database.accessoryItems)
                ..where((item) => item.subCategory
                    .equals(myToolList[2].menuList![accessorySubCategory][1])))
              .get())
          .reversed));
    }

    setState(() {
      itemList.add(characterItemList);
      itemList.add(armorItemList);
      itemList.add(accessoryItemList);
    });
  }

  void onWillPop(bool b) {
    DateTime currentTime = DateTime.now();

    if (currentBackPressTime == null ||
        currentTime.difference(currentBackPressTime!) >
            const Duration(seconds: 2)) {
      currentBackPressTime = currentTime;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xff6E6E6E),
          fontSize: 20,
          toastLength: Toast.LENGTH_SHORT);
      return;
    }
    SystemNavigator.pop();
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void setBeauty(String target, int color1, int color2) {
    setState(() {
      if (target == 'hair') {
        dodo.setHairColor(color1.toString());
        dodo2.setHairColor(color2.toString());
      } else {
        dodo.setLensColor(color1.toString());
        dodo2.setLensColor(color2.toString());
      }
    });
  }

  void setMyCharacter(dynamic selectedItem, int buttonIdx) {
    if (dodo.itemMap[selectedItem.subCategory][0] !=
        selectedItem.id.toString()) {
      setState(() {
        dodo.updateMyCharacter(
            subCategory: selectedItem.subCategory,
            itemId: selectedItem.id.toString(),
            itemName: selectedItem.name);
        dodo2.updateMyCharacter(
            subCategory: selectedItem.subCategory,
            itemId: selectedItem.id.toString(),
            itemName: selectedItem.name);
        currentListButtonIdx = buttonIdx;
      });
    }
  }

  void takeOffItem(String subCategory) {
    if (subCategory == 'Hair' ||
        subCategory == 'Face' ||
        subCategory == 'Head') {
      return;
    }

    setState(() {
      dodo.takeOffItem(subCategory: subCategory);
      dodo2.takeOffItem(subCategory: subCategory);
      currentListButtonIdx = -1;
    });
  }

  void undoImage() {
    if (dodo.itemQueueIdx > 0) {
      setState(() {
        dodo.undo();
        dodo2.undo();
        currentListButtonIdx = -1;
      });
    }
  }

  void redoImage() {
    if (dodo.itemQueue.length > dodo.itemQueueIdx + 1) {
      setState(() {
        dodo.redo();
        dodo2.redo();
        currentListButtonIdx = -1;
      });
    }
  }

  void switchBackground(String background) {
    setState(() {
      if (this.background != background) {
        this.background = background;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff2B3A55)),
    );

    Widget characterBox;
    if (background == 'normal') {
      characterBox = Container(
        color: const Color.fromARGB(255, 230, 222, 218),
      );
    } else {
      characterBox = Image.asset(
        fit: BoxFit.fitHeight,
        backgroundsList[background]![1],
      );
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);

    return MaterialApp(
      home: PopScope(
        canPop: false,
        onPopInvoked: onWillPop,
        child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(color: Color(0xff2B3A55)),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 110),
                      CharacterBoard(characterBox: characterBox),
                      const SizedBox(height: 14),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1),
                          color: const Color.fromARGB(255, 181, 103, 103),
                        ),
                        height: 2,
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 7, right: 7),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 430,
                    child: CachedNetworkImage(
                      imageUrl: dodo.getMyCharacter(),
                      fadeInDuration: const Duration(milliseconds: 400),
                      fadeOutDuration: const Duration(milliseconds: 400),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported_outlined),
                      useOldImageOnUrlChange: true,
                      cacheManager: CacheManager(
                        Config("character",
                            stalePeriod: const Duration(days: 1),
                            maxNrOfCacheObjects: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 430,
                    child: Opacity(
                      opacity: 0.5,
                      child: CachedNetworkImage(
                        imageUrl: dodo2.getMyCharacter(),
                        fadeInDuration: const Duration(milliseconds: 400),
                        fadeOutDuration: const Duration(milliseconds: 400),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported_outlined),
                        useOldImageOnUrlChange: true,
                        cacheManager: CacheManager(
                          Config("character",
                              stalePeriod: const Duration(days: 1),
                              maxNrOfCacheObjects: 20),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      MyCustomAppBar(clickEvent: _openEndDrawer),
                      const SizedBox(height: 20),
                      BackgroundButtons(switchBackground: switchBackground),
                      const SizedBox(height: 230),
                      Flexible(
                        fit: FlexFit.loose,
                        child: itemList.isNotEmpty
                            ? CoordinatingTools(
                                listButtonClicked: setMyCharacter,
                                clickedButtonIdx: currentListButtonIdx,
                                currentCharacter: dodo,
                                currentCharacter2: dodo2,
                                clickedClose: takeOffItem,
                                undoImage: undoImage,
                                redoImage: redoImage,
                                itemList: itemList,
                                colorApplyButtonClicked: setBeauty,
                              )
                            : Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 230, 222, 218),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: CircularProgressIndicator()),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
