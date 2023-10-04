import 'package:flutter/material.dart';
import 'package:maple_closet/button_map.dart';

class MapButtonLayout extends StatelessWidget {
  const MapButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MapButton(imagePath: 'assets/wowgood.jpg'),
          MapButton(imagePath: 'assets/icon_arcana.jpg'),
          MapButton(imagePath: 'assets/wowgood.jpg'),
          MapButton(imagePath: 'assets/wowgood.jpg'),
          MapButton(imagePath: 'assets/wowgood.jpg'),
        ],
      ),
    );
  }
}
