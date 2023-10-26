import 'package:flutter/material.dart';

class BackgroundButtons extends StatefulWidget {
  final Widget characterBox;

  const BackgroundButtons({super.key, required this.characterBox});

  @override
  State<StatefulWidget> createState() {
    return _BackgroundButtons();
  }
}

class _BackgroundButtons extends State<BackgroundButtons> {
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
