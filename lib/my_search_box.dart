import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBox();
  }
}

class _SearchBox extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 208, 208, 208),
        ),
      ),
    );
  }
}
