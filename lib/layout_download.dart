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
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Color(0xffdddddd)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: const Text('해당 기능은 준비중입니다.'),
    );
  }
}
