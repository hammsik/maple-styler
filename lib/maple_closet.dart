import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';

class MapleCloset extends StatefulWidget {
  MyCharacter dodo = MyCharacter();
  MapleCloset({super.key});

  @override
  State<StatefulWidget> createState() => _MapleCloset();
}

class _MapleCloset extends State<MapleCloset> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void setMyCharacter() {}

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xff2B3A55)),
    );

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
                    const SizedBox(height: 65),
                    CharacterBoard(),
                    const SizedBox(height: 14),
                    Container(
                      height: 2,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 7, right: 7),
                      // color: Color.fromARGB(255, 193, 105, 105),
                      color: const Color.fromARGB(255, 181, 103, 103),
                    ),
                    const SizedBox(height: 14),
                    const Flexible(
                        fit: FlexFit.loose, child: CoordinatingTools()),
                  ],
                ),
                Container(
                  height: 430,
                  // child: Image.network(widget.dodo.getMyCharacterURL()),
                  child: Image.network(
                      'https://maplestory.io/api/Character/{"itemId":12009,"version":"1157","region":"KMST","animationName":"default"},{"itemId":2009,"version":"1157","region":"KMST","animationName":"default"},{"itemId":50137,"version":"1157","region":"KMST","animationName":"default"},{"itemId":68090,"version":"1157","region":"KMST","animationName":"default"},{"itemId":1040036,"version":"1157","region":"KMST","animationName":"default"},{"itemId":1060026,"version":"1157","region":"KMST","animationName":"default"},{"itemId":1702565,"version":"1157","region":"KMST","animationName":"default"},{"itemId":1102453,"version":"1157","region":"KMST","animationName":"default"}/stand1/0/?renderMode=2'),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    MyCustomAppBar(clickEvent: _openEndDrawer),
                    const SizedBox(height: 20),
                    // 여기에 맵 버튼들 추가!!!
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
