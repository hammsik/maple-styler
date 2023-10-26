import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

class ItemMenu extends StatefulWidget {
  final MyTool currentTool;
  final String currentMenuItem;
  final Function buttonClicked;

  const ItemMenu(
      {super.key,
      required this.currentTool,
      required this.currentMenuItem,
      required this.buttonClicked});

  @override
  State<StatefulWidget> createState() {
    return _ItemMenu();
  }
}

class _ItemMenu extends State<ItemMenu> {
  @override
  Widget build(BuildContext context) {
    if (widget.currentTool.isNeedMenu) {
      return MenuAnchor(
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
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 230, 222, 218),
                ),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Expanded(
                    child: Text(
                      widget.currentMenuItem,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nanumMyeongjo(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_left_sharp),
                  const SizedBox(
                    width: 8,
                  )
                ]),
              ),
            ),
          );
        },
        menuChildren: [
          ...widget.currentTool.menuList!.map(
            (item) => Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 222, 218),
                  borderRadius: BorderRadius.circular(4)),
              child: MenuItemButton(
                onPressed: () => widget.buttonClicked(item[0], item[1]),
                child: Text(
                  item[0],
                  style: GoogleFonts.nanumMyeongjo(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      );
    } else {
      return const Text('null');
    }
  }
}
