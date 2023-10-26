import 'package:flutter/material.dart';
import 'package:maple_closet/button_map_icon.dart';
import 'package:maple_closet/data/backgrounds.dart';

class CharacterBoard extends StatefulWidget {
  final Function switchBackground;

  CharacterBoard({super.key, required this.switchBackground});

  @override
  State<StatefulWidget> createState() {
    return _CharacterBoardState();
  }
}

class _CharacterBoardState extends State<CharacterBoard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MapButton(
          backgroundName: 'normal',
          clickEvent: () => widget.switchBackground('normal'),
        ),
        MapButton(
          backgroundName: 'henesis',
          clickEvent: () => widget.switchBackground('henesis'),
        ),
        MapButton(
          backgroundName: 'kerningcity',
          clickEvent: () => widget.switchBackground('kerningcity'),
        ),
        MapButton(
          backgroundName: 'arcana',
          clickEvent: () => widget.switchBackground('arcana'),
        ),
        MapButton(
          backgroundName: 'sernium',
          clickEvent: () => widget.switchBackground('sernium'),
        ),
      ],
    );
  }
}
