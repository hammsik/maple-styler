import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_character_info.dart';
import 'package:maple_closet/layout_map_buttons.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';
import 'package:maple_closet/database/database.dart';
import 'data/backgrounds.dart';

class MapleStylerHome extends StatefulWidget {
  const MapleStylerHome({super.key});

  @override
  State<StatefulWidget> createState() => _MapleStylerHome();
}

class _MapleStylerHome extends State<MapleStylerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCharacter dodo = MyCharacter();
  MyCharacter dodo2 = MyCharacter();
  Future? _characterImage;
  String background = 'normal';
  int currentToolIdx = 0;
  int currentMenuIdx = 0;
  int currentListButtonIdx = -1;
  List<List<List<dynamic>>> itemList = [];
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    initDB();
  }

  // 위젯 첫 생성 시에 이미지를 불러오기 위해 didChangeDependencies()에서 호출
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCharacterImageFromNetwork();
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
      getCharacterImageFromNetwork();
    });
  }

  void setMyCharacter(dynamic selectedItem, int buttonIdx) {
    if (dodo.itemMap[selectedItem.subCategory][0] !=
        selectedItem.itemid.toString()) {
      setState(() {
        dodo.updateMyCharacter(
            subCategory: selectedItem.subCategory,
            itemId: selectedItem.itemid.toString(),
            itemName: selectedItem.name);
        dodo2.updateMyCharacter(
            subCategory: selectedItem.subCategory,
            itemId: selectedItem.itemid.toString(),
            itemName: selectedItem.name);

        if (buttonIdx == -2) {
          bool found = false;
          for (int toolIdx = 0; toolIdx < 3; toolIdx++) {
            for (int subCategoryIdx = 0;
                subCategoryIdx < myToolList[toolIdx].menuList!.length;
                subCategoryIdx++) {
              if (myToolList[toolIdx].menuList![subCategoryIdx][1] ==
                  selectedItem.subCategory) {
                currentToolIdx = toolIdx;
                currentMenuIdx = subCategoryIdx;
                found = true;
                break;
              }
            }
            if (found) {
              break;
            }
          }
        }

        currentListButtonIdx = buttonIdx;
        getCharacterImageFromNetwork();
      });
    }
  }

  void setCurrentToolIdx(int toolButtonIdx) {
    setState(() {
      currentToolIdx = toolButtonIdx;
      currentMenuIdx = 0;
      currentListButtonIdx = -1;
    });
  }

  void setCurrentMenuIdx(int menuIdx) {
    setState(() {
      currentMenuIdx = menuIdx;
      currentListButtonIdx = -1;
    });
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
      getCharacterImageFromNetwork();
    });
  }

  void undoImage() {
    if (dodo.itemQueueIdx > 0) {
      setState(() {
        dodo.undo();
        dodo2.undo();
        currentListButtonIdx = -1;
        getCharacterImageFromNetwork();
      });
    }
  }

  void redoImage() {
    if (dodo.itemQueue.length > dodo.itemQueueIdx + 1) {
      setState(() {
        dodo.redo();
        dodo2.redo();
        currentListButtonIdx = -1;
        getCharacterImageFromNetwork();
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

  void openCharacterDetail(
      BuildContext context, MyCharacter dodo, MyCharacter dodo2) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              CharacterDetail(dodo: dodo, dodo2: dodo2),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          opaque: false,
        )).then((_) => setState(() {}));
  }

  void getCharacterImageFromNetwork() {
    _characterImage = Future.wait([
      precacheImage(NetworkImage(dodo.getMyCharacter(imageFrame: '0')), context),
      precacheImage(NetworkImage(dodo2.getMyCharacter(imageFrame: '0')), context),

      precacheImage(NetworkImage(dodo.getMyCharacter(imageFrame: '1')), context),
      precacheImage(NetworkImage(dodo2.getMyCharacter(imageFrame: '1')), context),

      precacheImage(NetworkImage(dodo.getMyCharacter(imageFrame: '2')), context),
      precacheImage(NetworkImage(dodo2.getMyCharacter(imageFrame: '2')), context),

      precacheImage(NetworkImage(dodo.getMyCharacter(imageFrame: '3')), context),
      precacheImage(NetworkImage(dodo2.getMyCharacter(imageFrame: '3')), context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff2B3A55)),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);

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

    return PopScope(
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
                FutureBuilder(
                  future: _characterImage,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        height: 430,
                        child: Hero(
                          tag: 'character',
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(dodo.getMyCharacter(imageFrame: '0')),
                              Opacity(
                                opacity: 0.5,
                                child: Image.network(dodo2.getMyCharacter(imageFrame: '0')),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(top: 198),
                        child: Image.asset('assets/drummingBunny.gif'),
                      ); // 로딩 중일 때 표시할 위젯
                    }
                  },
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    MyCustomAppBar(clickEvent: _openEndDrawer),
                    const SizedBox(height: 20),
                    BackgroundButtons(switchBackground: switchBackground),
                    const SizedBox(height: 30),
                    FutureBuilder(
                      future: _characterImage,
                      builder: (context, snapshot) {
                        return Material(
                          type: MaterialType.transparency,
                          child: InkResponse(
                            onTap: snapshot.connectionState ==
                                    ConnectionState.done
                                ? () {
                                    openCharacterDetail(context, dodo, dodo2);
                                  }
                                : null,
                            splashFactory: InkSplash.splashFactory,
                            child: Container(
                              clipBehavior: Clip.none,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
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
                              currentToolIdx: currentToolIdx,
                              currentMenuIdx: currentMenuIdx,
                              toolButtonClick: setCurrentToolIdx,
                              menuButtonClick: setCurrentMenuIdx,
                            )
                          : Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 230, 222, 218),
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
    );
  }
}
