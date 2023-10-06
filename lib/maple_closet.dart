import 'package:flutter/material.dart';
import 'package:maple_closet/layout_character_board.dart';
import 'package:maple_closet/layout_coordinating_tool.dart';

class MapleCloset extends StatelessWidget {
  const MapleCloset({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(22),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CharacterBoard(),
              SizedBox(height: 14),
              Container(
                height: 1,
                width: double.infinity,
                margin: EdgeInsets.only(left: 7, right: 7),
                color: Color.fromARGB(255, 108, 108, 108),
              ),
              SizedBox(height: 14),
              CoordinatingTools(),
            ],
          ),
        ),
      ),
    );
  }
}
