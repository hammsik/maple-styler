import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';

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
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "MAPLE CLOSET",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.info_outlined,
              color: Colors.black,
              size: 30,
            ),
            alignment: Alignment.center,
          ),
          actions: [
            IconButton(
              onPressed: _openEndDrawer,
              icon: Icon(Icons.account_box),
              color: Colors.black,
            ),
          ],
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        ),
        endDrawer: Drawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 250, 250, 250)),
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              CharacterBoard(),
              const SizedBox(height: 14),
              Container(
                height: 1,
                width: double.infinity,
                margin: EdgeInsets.only(left: 7, right: 7),
                color: Color.fromARGB(255, 108, 108, 108),
              ),
              const SizedBox(height: 14),
              Expanded(child: CoordinatingTools()),
            ],
          ),
        ),
      ),
    );
  }
}
