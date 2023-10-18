import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';
import 'package:maple_closet/layout_custom_app_bar.dart';

class MapleCloset extends StatefulWidget {
  const MapleCloset({super.key});

  @override
  State<StatefulWidget> createState() => _MapleCloset();
}

class _MapleCloset extends State<MapleCloset> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

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
            child: Column(
              children: [
                const SizedBox(height: 20),
                MyCustomAppBar(clickEvent: _openEndDrawer),
                const SizedBox(height: 20),
                const CharacterBoard(),
                const SizedBox(height: 14),
                Container(
                  height: 2,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 7, right: 7),
                  // color: Color.fromARGB(255, 193, 105, 105),
                  color: Color.fromARGB(255, 181, 103, 103),
                ),
                const SizedBox(height: 14),
                Flexible(fit: FlexFit.loose, child: const CoordinatingTools()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
