import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class ItemMenu extends ConsumerWidget {
  final MyTool currentTool;

  const ItemMenu({
    super.key,
    required this.currentTool,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    currentTool
                        .subCategoryMap![currentTool.currentSubcategoryType]!
                        .nameKo,
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
      menuChildren: currentTool.subCategoryMap!.values
          .map(
            (subCategory) => Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 230, 222, 218),
                  borderRadius: BorderRadius.circular(4)),
              child: MenuItemButton(
                onPressed: () => ref
                    .read(toolMapProvider.notifier)
                    .changeSubcategory(
                        toolType: currentTool.toolType,
                        subcategoryType: subCategory.type),
                child: Text(
                  subCategory.nameKo,
                  style: GoogleFonts.nanumMyeongjo(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
