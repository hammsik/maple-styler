import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/page/tools/layout_color.dart';
import 'package:maple_closet/page/tools/layout_favorite.dart';
import 'package:maple_closet/page/tools/my_item_menu.dart';
import 'package:maple_closet/page/tools/my_selected_item.dart';
import 'package:maple_closet/providers/item_provider.dart';
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
    final currentTool =
        ref.watch(toolMapProvider)[ref.watch(toolTypeSettingProvider)]!;

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
          MytoolButtons(
            currentTool: currentTool,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: currentTool.toolType == ToolType.color
                ? const ColorLayout()
                : currentTool.toolType == ToolType.favorite
                    ? const FavoriteLayout()
                    : currentTool.toolType == ToolType.unknown
                        ? const UndefinedLayout()
                        : Column(
                            children: [
                              Row(
                                children: [
                                  ItemMenu(
                                    currentTool: currentTool,
                                  ),
                                  const SizedBox(width: 8),
                                  SelectedItem(
                                      currentSubCategory: currentTool
                                              .subCategoryMap![
                                          currentTool.currentSubcategoryType]!),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 230, 222, 218),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child:
                                          ref.watch(mapleItemListProvider).when(
                                                data: (map) => ItemList(
                                                    key: ValueKey(currentTool),
                                                    itemList: map[currentTool
                                                                .toolType]![
                                                            currentTool
                                                                .currentSubcategoryType] ??
                                                        []),
                                                error: (error, stackTrace) =>
                                                    Center(
                                                  child: Text(
                                                      '에러가 발생했습니다. 에러코드: ${error.toString()}'),
                                                ),
                                                loading: () => const Center(
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                              ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
          ),
        ],
      ),
    );
  }
}
