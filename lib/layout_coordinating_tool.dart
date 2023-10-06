import 'package:flutter/material.dart';
import 'package:maple_closet/my_search_box.dart';
import 'package:maple_closet/my_tools.dart';
import 'package:maple_closet/my_undo_and_redo.dart';

class CoordinatingTools extends StatelessWidget {
  const CoordinatingTools({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [SearchBox(), SizedBox(width: 8), UndoAndRedo()],
        ),
        SizedBox(height: 10),
        MyTools(),
        // Row(
        //   children: [SelectedItem(), ItemMenu()],
        // ),
        // ItemList(),
      ],
    );
  }
}
