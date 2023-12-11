import 'package:flutter/material.dart';

class FavoriteLayout extends StatefulWidget {
  const FavoriteLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteLayout();
  }
}

class _FavoriteLayout extends State<FavoriteLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text('❤ 기능은 준비중입니다.'),
    );
  }
}
