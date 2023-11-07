import 'package:flutter/material.dart';

class CharacterBoard extends StatefulWidget {
  final Widget characterBox;

  const CharacterBoard({super.key, required this.characterBox});

  @override
  State<StatefulWidget> createState() {
    return _CharacterBoard();
  }
}

class _CharacterBoard extends State<CharacterBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: widget.characterBox,
      ),
    );
  }
}
