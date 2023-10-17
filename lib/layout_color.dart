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
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Color(0xffdddddd)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: const Text('해당 기능은 준비중입니다.'),
    );
  }
}
