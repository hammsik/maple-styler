import 'package:flutter/material.dart';

class ColorLayout extends StatefulWidget {
  const ColorLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ColorLayout();
  }
}

class _ColorLayout extends State<ColorLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      // width: MediaQuery.of(context).size.width,
      child: const Text('컬러 기능은 준비중입니다.'),
    );
  }
}
