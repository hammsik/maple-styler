import 'package:flutter/material.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemMenu();
  }
}

class _ItemMenu extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromARGB(255, 208, 208, 208),
      ),
    );
  }
}
