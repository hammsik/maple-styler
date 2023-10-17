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
    int currentItemIdx = -1;
    if (widget.currentTool.isNeedMenu == true) {
      currentItemIdx = 0;
    }
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffF2E5E5),
      ),
      child: widget.currentTool.isNeedMenu
          ? MenuAnchor(
              builder: (BuildContext context, MenuController controller,
                  Widget? child) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    child: Row(children: [
                      Text(widget.currentTool.menuList![currentItemIdx]),
                    ]),
                  ),
                );
              },
              menuChildren: [
                ...widget.currentTool.menuList!.map((item) => Text(item))
              ],
            )
          : Text('없떠요'),
    );
  }
}
