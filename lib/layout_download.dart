import 'package:flutter/material.dart';

class DownloadLayout extends StatefulWidget {
  const DownloadLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DownloadLayout();
  }
}

class _DownloadLayout extends State<DownloadLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: const Text('저장 기능은 준비중입니다.'),
    );
  }
}
