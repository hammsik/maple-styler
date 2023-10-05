import 'package:flutter/material.dart';
import 'package:maple_closet/data/backgrounds.dart';

class MapButton extends StatelessWidget {
  final String backgroundName;
  final Function() clickEvent;

  const MapButton({
    super.key,
    required this.backgroundName,
    required this.clickEvent,
  });

  @override
  Widget build(BuildContext context) {
    Widget mapIcon;

    if (backgroundName == 'normal') {
      mapIcon = Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 208, 208, 208)),
      );
    } else {
      mapIcon = Image.asset(
        fit: BoxFit.cover,
        backgroundsList[backgroundName]![0],
      );
    }

    return GestureDetector(
      onTap: clickEvent,
      child: Container(
        width: 55,
        height: 32,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: const Color.fromARGB(255, 122, 122, 122), width: 0.2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: mapIcon,
        ),
      ),
    );
  }
}
