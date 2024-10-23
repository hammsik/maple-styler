import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/page/tools/layout_color.dart';
import 'package:maple_closet/page/tools/layout_favorite.dart';
import 'package:maple_closet/page/tools/my_item_menu.dart';
import 'package:maple_closet/page/tools/my_selected_item.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/widgets/layout_undifined.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';

class CoordinatingTools extends ConsumerWidget {
  const CoordinatingTools({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget specialWidget;
    final currentTool = ref.watch(toolSettingProvider);

    switch (currentTool.toolType) {
      case ToolType.color:
        specialWidget = const ColorLayout();
      case ToolType.unknown:
        specialWidget = const UndefinedLayout();
      default:
        specialWidget = const FavoriteLayout();
    }

    return DefaultTextStyle(
      style: GoogleFonts.nanumMyeongjo(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 12,
          fontWeight: FontWeight.w700),
      child: Column(
        children: [
          const Row(
            children: [
              SearchBox(),
              SizedBox(width: 8),
              UndoAndRedo(),
            ],
          ),
          const SizedBox(height: 8),
          const MytoolButtons(),
          const SizedBox(height: 8),
          Expanded(
            child: currentTool.idx < 3
                ? Column(
                    children: [
                      Row(
                        children: [
                          ItemMenu(
                            currentTool: currentTool,
                          ),
                          const SizedBox(width: 8),
                          const SelectedItem(),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: ItemList(
                          currentTool: currentTool,
                        ),
                      ),
                    ],
                  )
                : specialWidget,
          ),
        ],
      ),
    );
  }
}
