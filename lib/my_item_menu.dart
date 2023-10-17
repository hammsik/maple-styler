import 'package:flutter/material.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

class ItemMenu extends StatefulWidget {
  final MyTool currentTool;

  const ItemMenu({required this.currentTool, super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemMenu();
  }
}

class _ItemMenu extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    int currentItemIdx = 0;

    return widget.currentTool.isNeedMenu
        ? MenuAnchor(
            builder: (BuildContext context, MenuController controller,
                Widget? child) {
              return GestureDetector(
                onTap: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 230, 222, 218),
                  ),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(
                      child: Text(
                        widget.currentTool.menuList![currentItemIdx],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_left_sharp),
                    const SizedBox(
                      width: 8,
                    )
                  ]),
                ),
              );
            },
            menuChildren: [
              ...widget.currentTool.menuList!.map((item) => Text(item))
            ],
          )
        : Text('없떠요');
  }
}
