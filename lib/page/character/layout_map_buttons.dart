import 'package:flutter/material.dart';
import 'package:maple_closet/page/character/button_map_icon.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class BackgroundButtons extends StatelessWidget {
  final Function switchBackground;

  const BackgroundButtons({super.key, required this.switchBackground});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MapButton(
          backgroundType: BackgroundType.basic,
        ),
        MapButton(
          backgroundType: BackgroundType.henesis,
        ),
        MapButton(
          backgroundType: BackgroundType.kerningcity,
        ),
        MapButton(
          backgroundType: BackgroundType.arcana,
        ),
        MapButton(
          backgroundType: BackgroundType.sernium,
        ),
      ],
    );
  }
}
