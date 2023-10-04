import 'package:flutter/material.dart';

class MapButton extends StatelessWidget {
  late Widget mapIcon;

  MapButton({
    super.key,
    required String imagePath,
  }) {
    if (imagePath == 'normal') {
      mapIcon = Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 208, 208, 208)),
      );
    } else {
      mapIcon = Image.asset(
        fit: BoxFit.cover,
        imagePath,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('button has tapped.'),
      child: Container(
        width: 60,
        height: 35,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: const Color.fromARGB(255, 122, 122, 122), width: 0.4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: mapIcon,
        ),
      ),
    );
  }
}
