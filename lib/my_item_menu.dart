import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

class ItemMenu extends StatefulWidget {
  final MyTool currentTool;
  final int currentMenuIdx;
  final Function buttonClicked;

  const ItemMenu(
      {super.key,
      required this.currentTool,
      required this.currentMenuIdx,
      required this.buttonClicked});

  @override
  State<StatefulWidget> createState() {
    return _ItemMenu();
  }
}

class _ItemMenu extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: const MenuStyle(alignment: Alignment.centerRight),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            child: Ink(
              height: 40,
              width: 101,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 230, 222, 218),
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                  child: Text(
                    widget.currentTool.menuList![widget.currentMenuIdx][0],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nanumMyeongjo(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down_rounded),
                const SizedBox(
                  width: 8,
                )
              ]),
            ),
          ),
        );
      },
      menuChildren: [
        ...widget.currentTool.menuList!
            .asMap()
            .map((index, item) => MapEntry(
                  index,
                  Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 222, 218),
                        borderRadius: BorderRadius.circular(4)),
                    child: MenuItemButton(
                      onPressed: () => widget.buttonClicked(index),
                      child: Text(
                        item[0],
                        style: GoogleFonts.nanumMyeongjo(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ))
            .values
            .toList()
      ],
    );
  }
}
