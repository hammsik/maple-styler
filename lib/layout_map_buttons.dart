import 'package:flutter/material.dart';
import 'package:maple_closet/button_map_icon.dart';

class BackgroundButtons extends StatefulWidget {
  final Function switchBackground;

  const BackgroundButtons({super.key, required this.switchBackground});

  @override
  State<StatefulWidget> createState() {
    return _BackgroundButtonsState();
  }
}

class _BackgroundButtonsState extends State<BackgroundButtons> {
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
