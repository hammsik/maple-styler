import 'package:flutter/material.dart';

class SelectedItem extends StatefulWidget {
  SelectedItem({super.key});

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
          color: Color.fromARGB(255, 208, 208, 208),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
