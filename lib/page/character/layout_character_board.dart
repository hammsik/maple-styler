import 'package:flutter/material.dart';

class CharacterBoard extends StatelessWidget {
  final Widget characterBox;
  final double height;

  const CharacterBoard({
    super.key,
    required this.characterBox,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: characterBox,
      ),
    );
  }
}
