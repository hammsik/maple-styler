import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/page/character/layout_character_info.dart';
import 'package:maple_closet/page/character/layout_map_buttons.dart';
import 'package:maple_closet/page/character/layout_character_board.dart';
import 'package:maple_closet/page/tools/layout_coordinating_tool.dart';
import 'package:maple_closet/page/header/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_character.dart';
import 'package:maple_closet/providers/character_history_provider.dart';
import '../data/backgrounds.dart';

class MapleStylerHome extends StatefulHookConsumerWidget {
  const MapleStylerHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapleStylerHomeState();
}

class _MapleStylerHomeState extends ConsumerState<MapleStylerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCharacter dodo = MyCharacter();
  MyCharacter dodo2 = MyCharacter();
  Future? _characterImage;
  Future? _characterImage2;
  Future? _characterImage3;
  String background = 'normal';
  DateTime? currentBackPressTime;

  // 위젯 첫 생성 시에 이미지를 불러오기 위해 didChangeDependencies()에서 호출
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCharacterImageFromNetwork();
  }

  // 안드로이드에서 뒤로가기 감지를 위한 함수
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
          fontSize: 18,
          toastLength: Toast.LENGTH_SHORT);
      return;
    }
    SystemNavigator.pop();
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

  // void setMyCharacter(Item selectedItem, int buttonIdx) {
  //   // 이미 선택된 아이템이면 early return
  //   final replacement = selectedItem.subCategoryType.toString().split(".")[1];
  //   final convertedType =
  //       replacement[0].toUpperCase() + replacement.substring(1);
  //   if (dodo.itemMap[convertedType][0] == selectedItem.id.toString()) {
  //     return;
  //   }

  //   setState(
  //     () {
  //       dodo.updateMyCharacter(
  //           subCategory: convertedType,
  //           itemId: selectedItem.id.toString(),
  //           itemName: selectedItem.name);
  //       dodo2.updateMyCharacter(
  //           subCategory: convertedType,
  //           itemId: selectedItem.id.toString(),
  //           itemName: selectedItem.name);

  //       if (buttonIdx == -2) {
  //         bool found = false;
  //         for (int toolIdx = 0; toolIdx < 3; toolIdx++) {
  //           for (int subCategoryIdx = 0;
  //               subCategoryIdx < myToolList[toolIdx].subCategoryList!.length;
  //               subCategoryIdx++) {
  //             if (myToolList[toolIdx].subCategoryList![subCategoryIdx].type ==
  //                 convertedType) {
  //               currentToolIdx = toolIdx;
  //               currentMenuIdx = subCategoryIdx;
  //               found = true;
  //               break;
  //             }
  //           }
  //           if (found) {
  //             break;
  //           }
  //         }
  //       }

  //       currentListButtonIdx = buttonIdx;
  //       getCharacterImageFromNetwork();
  //     },
  //   );
  // }

  // void takeOffItem(String subCategory) {
  //   if (subCategory == 'Hair' ||
  //       subCategory == 'Face' ||
  //       subCategory == 'Head') {
  //     return;
  //   }

  //   setState(() {
  //     dodo.takeOffItem(subCategory: subCategory);
  //     dodo2.takeOffItem(subCategory: subCategory);
  //     currentListButtonIdx = -1;
  //     getCharacterImageFromNetwork();
  //   });
  // }

  // void undoImage() {
  //   if (dodo.itemQueueIdx > 0) {
  //     setState(() {
  //       dodo.undo();
  //       dodo2.undo();
  //       currentListButtonIdx = -1;
  //       getCharacterImageFromNetwork();
  //     });
  //   }
  // }

  // void redoImage() {
  //   if (dodo.itemQueue.length > dodo.itemQueueIdx + 1) {
  //     setState(() {
  //       dodo.redo();
  //       dodo2.redo();
  //       currentListButtonIdx = -1;
  //       getCharacterImageFromNetwork();
  //     });
  //   }
  // }

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
      ),
    ).then(
      // 디테일 페이지에서 캐릭터 변경했을 시에 이미지 다시 불러오기를 위한 콜백
      (_) => setState(() {}),
    );
  }

  // TODO: 이 부분 listen 콜백걸기
  void getCharacterImageFromNetwork() {
    _characterImage = Future.wait([
      precacheImage(
          NetworkImage(dodo.getMyCharacter(imageFrame: '0')), context),
      precacheImage(
          NetworkImage(dodo2.getMyCharacter(imageFrame: '0')), context),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
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

    ref.watch(characterHistoryProvider);
    final urls = ref
        .read(characterHistoryProvider.notifier)
        .getCurrentCharacterImageUrl();
    // _characterImage2 = Future.wait(urls.map(
    //   (e) => precacheImage(NetworkImage(e), context),
    // ));

    _characterImage3 = ref
        .read(characterHistoryProvider.notifier)
        .getCurrentCharacterImageByUint();

    return PopScope(
      canPop: false,
      onPopInvoked: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xff2B3A55),
        // 키보드가 올라올 때 화면이 줄어드는 것을 방지
        resizeToAvoidBottomInset: false,
        endDrawer: const Drawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 110),
                    CharacterBoard(
                      characterBox: characterBox,
                      height: 190,
                    ),
                    const SizedBox(height: 14),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: const Color.fromARGB(255, 181, 103, 103),
                      ),
                      height: 2,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 7),
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
                              Image.network(
                                  dodo.getMyCharacter(imageFrame: '0')),
                              Opacity(
                                opacity: 0.5,
                                child: Image.network(
                                    dodo2.getMyCharacter(imageFrame: '0')),
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
                    MyCustomAppBar(
                        clickEvent: () =>
                            _scaffoldKey.currentState!.openEndDrawer()),
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
                    Expanded(
                        child: CoordinatingTools(
                      listButtonClicked: () {},
                      // clickedButtonIdx: currentListButtonIdx,
                      // currentCharacter: dodo,
                      // currentCharacter2: dodo2,
                      // clickedClose: takeOffItem,
                      // undoImage: undoImage,
                      // redoImage: redoImage,
                      // colorApplyButtonClicked: setBeauty,
                      // currentToolIdx: currentToolIdx,
                      // currentMenuIdx: currentMenuIdx,
                      // toolButtonClick: setCurrentToolIdx,
                      // menuButtonClick: setCurrentMenuIdx,
                    )),
                  ],
                ),
                // FutureBuilder(
                //   future: _characterImage2,
                //   builder: (context, snapshot) {
                //     if (snapshot.connectionState == ConnectionState.done) {
                //       return SizedBox(
                //         height: 230,
                //         child: Stack(
                //           fit: StackFit.expand,
                //           children: [
                //             Image.network(urls[0]),
                //             Opacity(
                //               opacity: 0.5,
                //               child: Image.network(urls[1]),
                //             ),
                //           ],
                //         ),
                //       );
                //     } else {
                //       return Container(
                //         margin: const EdgeInsets.only(top: 98),
                //         child: Image.asset('assets/drummingBunny.gif'),
                //       ); // 로딩 중일 때 표시할 위젯
                //     }
                //   },
                // ),
                FutureBuilder(
                  future: _characterImage3,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SizedBox(
                        height: 100,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.memory(snapshot.data[0]),
                            Opacity(
                              opacity: 0.5,
                              child: Image.memory(snapshot.data[1]),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.only(top: 28),
                        child: Image.asset('assets/drummingBunny.gif'),
                      ); // 로딩 중일 때 표시할 위젯
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
