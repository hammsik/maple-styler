import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maple_closet/api_maple_io.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_map_buttons.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';
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
  String background = 'normal';
  int currentListButtonIdx = -1;
  String currentSubCategory = 'Hair';
  List<List<List<dynamic>>> itemApiList = [];
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    initItemList();
  }

  void initItemList() async {
    List<List<List<dynamic>>> oldList = [];
    for (int i = 0; i < 3; i++) {
      for (int subCategory = 0;
          subCategory < myToolList[i].menuList!.length;
          subCategory++) {
        oldList.add(await MapleAPI.getItemList(myToolList[i].toolName_en!,
            myToolList[i].menuList![subCategory][1]));
      }
    }
    setState(() {
      itemApiList = oldList;
    });
  }

  Future<bool> onWillPop() async {
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
      return false;
    }
    return true;
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void setMyCharacter(String inputSubCategory, String inputItemId,
      String inputItemName, int buttonIdx) {
    if (dodo.itemMap[inputSubCategory][0] != inputItemId) {
      setState(() {
        dodo.setMyCharacter(
            subCategory: inputSubCategory,
            itemId: inputItemId,
            itemName: inputItemName);
        currentListButtonIdx = buttonIdx;
        currentSubCategory = inputSubCategory;
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
      currentListButtonIdx = -1;
    });
  }

  void undoImage() {
    if (dodo.itemQueueIdx > 0) {
      setState(() {
        dodo.undo();
        currentListButtonIdx = -1;
      });
    }
  }

  void redoImage() {
    if (dodo.itemQueue.length > dodo.itemQueueIdx + 1 &&
        dodo.itemQueueIdx < 4) {
      setState(() {
        dodo.redo();
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
        fit: BoxFit.cover,
        backgroundsList[background]![1],
      );
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);

    return MaterialApp(
      home: WillPopScope(
        onWillPop: onWillPop,
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
                        height: 2,
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 7, right: 7),
                        color: const Color.fromARGB(255, 181, 103, 103),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   child: CircularProgressIndicator(),
                  // ),
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
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      MyCustomAppBar(clickEvent: _openEndDrawer),
                      const SizedBox(height: 20),
                      BackgroundButtons(switchBackground: switchBackground),
                      const SizedBox(height: 230),
                      Flexible(
                        fit: FlexFit.loose,
                        child: itemApiList.isNotEmpty
                            ? CoordinatingTools(
                                listButtonClicked: setMyCharacter,
                                clickedButtonIdx: currentListButtonIdx,
                                currentCharacter: dodo,
                                clickedClose: takeOffItem,
                                undoImage: undoImage,
                                redoImage: redoImage,
                                itemApiList: itemApiList,
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
