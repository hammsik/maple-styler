import 'package:flutter/material.dart';

class SelectedItem extends StatefulWidget {
  final String itemId;
  final String itemName;

  const SelectedItem({super.key, required this.itemId, required this.itemName});

  @override
  State<StatefulWidget> createState() {
    return _SelectedItem();
  }
}

class _SelectedItem extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 222, 218),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          Image.network(widget.itemId),
          Text(widget.itemName),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline_rounded)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.close_rounded))
        ]),
      ),
    );
  }
}
