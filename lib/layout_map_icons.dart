import 'package:flutter/material.dart';
import 'package:maple_closet/button_map_icon.dart';

class MapButtonLayout extends StatelessWidget {
  const MapButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MapButton(imagePath: 'normal'),
        MapButton(imagePath: 'assets/map/icon/icon_henesis.jpg'),
        MapButton(imagePath: 'assets/map/icon/icon_kerningcity.jpg'),
        MapButton(imagePath: 'assets/map/icon/icon_arcana.jpg'),
        MapButton(imagePath: 'assets/map/icon/icon_sernium.jpg'),
      ],
    );
  }
}
