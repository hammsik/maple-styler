import 'package:flutter/material.dart';

class AskLayout extends StatefulWidget {
  const AskLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AskLayout();
  }
}

class _AskLayout extends State<AskLayout> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: const Text('해당 기능은 준비중입니다.'),
    );
  }
}
