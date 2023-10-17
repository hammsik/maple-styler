import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemList();
  }
}

class _ItemList extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(255, 230, 222, 218),
      ),
    );
  }
}
