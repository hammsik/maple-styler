import 'package:flutter/material.dart';
import 'package:maple_closet/page/character/button_map_icon.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class BackgroundButtons extends StatelessWidget {
  const BackgroundButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MapButton(
          backgroundType: BackgroundType.basic,
        ),
        SizedBox(width: 12),
        MapButton(
          backgroundType: BackgroundType.henesis,
        ),
        SizedBox(width: 12),
        MapButton(
          backgroundType: BackgroundType.kerningcity,
        ),
        SizedBox(width: 12),
        MapButton(
          backgroundType: BackgroundType.arcana,
        ),
        SizedBox(width: 12),
        MapButton(
          backgroundType: BackgroundType.sernium,
        ),
      ],
    );
  }
}
