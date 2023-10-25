import 'package:flutter/material.dart';
import 'package:maple_closet/button_map_icon.dart';
import 'package:maple_closet/data/backgrounds.dart';

class CharacterBoard extends StatefulWidget {
  const CharacterBoard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CharacterBoardState();
  }
}

class _CharacterBoardState extends State<CharacterBoard> {
  var background = 'normal';

  void switchBackGround(String background) {
    if (this.background != background) {
      setState(() {
        this.background = background;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget characterBox;

    if (background != 'normal') {
      characterBox = Image.asset(
        fit: BoxFit.cover,
        backgroundsList[background]![1],
      );
    } else {
      characterBox = Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MapButton(
              backgroundName: 'normal',
              clickEvent: () => switchBackGround('normal'),
            ),
            MapButton(
              backgroundName: 'henesis',
              clickEvent: () => switchBackGround('henesis'),
            ),
            MapButton(
              backgroundName: 'kerningcity',
              clickEvent: () => switchBackGround('kerningcity'),
            ),
            MapButton(
              backgroundName: 'arcana',
              clickEvent: () => switchBackGround('arcana'),
            ),
            MapButton(
              backgroundName: 'sernium',
              clickEvent: () => switchBackGround('sernium'),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: characterBox,
          ),
        ),
      ],
    );
  }
}
