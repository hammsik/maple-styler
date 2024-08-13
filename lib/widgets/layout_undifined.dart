import 'package:flutter/material.dart';

class UndefinedLayout extends StatefulWidget {
  const UndefinedLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UndefinedLayout();
  }
}

class _UndefinedLayout extends State<UndefinedLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text('? 기능은 준비중입니다.'),
    );
  }
}
