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
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 208, 208, 208),
      ),
    );
  }
}
