import 'package:flutter/material.dart';

List<String> toolList = [];

class MyTools extends StatefulWidget {
  MyTools({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTools();
  }
}

class _MyTools extends State<MyTools> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 208, 208, 208),
          ),
          onPressed: () {},
          child: Text('뷰티'),
        ),
      ],
    );
  }
}
