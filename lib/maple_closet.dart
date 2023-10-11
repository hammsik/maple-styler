import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    );

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 250, 250, 250)),
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 14),
                MyCustomAppBar(clickEvent: _openEndDrawer),
                const SizedBox(height: 14),
                CharacterBoard(),
                const SizedBox(height: 14),
                Container(
                  height: 1,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 7, right: 7),
                  color: Color.fromARGB(255, 108, 108, 108),
                ),
                const SizedBox(height: 14),
                CoordinatingTools(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
