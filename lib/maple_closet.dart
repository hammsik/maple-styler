import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_background_buttons.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data/backgrounds.dart';

class MapleCloset extends StatefulWidget {
  const MapleCloset({super.key});

  @override
  State<StatefulWidget> createState() => _MapleCloset();
}

class _MapleCloset extends State<MapleCloset> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MyCharacter dodo = MyCharacter();
  String background = 'normal';
  int clickedListButtonIdx = -1;
  String selectedItemId = '68090';
  String selectedItemName = '검은색 허쉬 헤어';
  // Queue<String> CharacterImageQueue

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void setMyCharacter(String inputSubCategory, String inputItemId,
      String inputItemName, int buttonIdx) {
    setState(() {
      dodo.setMyCharacter(
          subCategory: inputSubCategory,
          itemId: inputItemId,
          itemName: inputItemName);
      clickedListButtonIdx = buttonIdx;
      selectedItemId = inputItemId;
      selectedItemName = inputItemName;
    });
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

    // Image characterImage = Image.network(dodo.getMyCharacterURL());

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(),
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
                      // color: Color.fromARGB(255, 193, 105, 105),
                      color: const Color.fromARGB(255, 181, 103, 103),
                    ),
                    const SizedBox(height: 14),
                  ],
                ),
                // SizedBox(
                //   child: CircularProgressIndicator(),
                // ),
                SizedBox(
                  height: 430,
                  child: CachedNetworkImage(
                    imageUrl: dodo.getMyCharacterURL(),
                    fadeInDuration: const Duration(milliseconds: 400),
                    fadeOutDuration: const Duration(milliseconds: 400),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.image_not_supported_outlined),
                    useOldImageOnUrlChange: true,
                    cacheManager: CacheManager(
                      Config("character",
                          stalePeriod: const Duration(days: 7),
                          maxNrOfCacheObjects: 1),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    MyCustomAppBar(clickEvent: _openEndDrawer),
                    const SizedBox(height: 20),
                    BackgroundButtons(switchBackground: switchBackground),
                    const SizedBox(height: 235),
                    Flexible(
                        fit: FlexFit.loose,
                        child: CoordinatingTools(
                          listButtonClicked: setMyCharacter,
                          clickedButtonIdx: clickedListButtonIdx,
                          selectedItemId: selectedItemId,
                          selectedItemName: selectedItemName,
                          currentCharacter: dodo,
                        )),
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
