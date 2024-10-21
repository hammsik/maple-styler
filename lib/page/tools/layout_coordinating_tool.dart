import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/page/tools/layout_color.dart';
import 'package:maple_closet/page/tools/layout_favorite.dart';
import 'package:maple_closet/page/tools/my_item_menu.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/widgets/layout_undifined.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';

class CoordinatingTools extends ConsumerWidget {
  final Function listButtonClicked;
  // final Function colorApplyButtonClicked;
  // final int clickedButtonIdx;
  // final Function clickedClose;
  // final Function() undoImage;
  // final Function() redoImage;
  // final MyCharacter currentCharacter;
  // final MyCharacter currentCharacter2;
  // final int currentToolIdx;
  // final int currentMenuIdx;
  // final Function toolButtonClick;
  // final Function menuButtonClick;

  const CoordinatingTools({
    super.key,
    required this.listButtonClicked,
    // required this.colorApplyButtonClicked,
    // required this.clickedButtonIdx,
    // required this.clickedClose,
    // required this.undoImage,
    // required this.redoImage,
    // required this.currentCharacter,
    // required this.currentCharacter2,
    // required this.currentToolIdx,
    // required this.currentMenuIdx,
    // required this.toolButtonClick,
    // required this.menuButtonClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget specialWidget;
    final currentTool = ref.watch(toolSettingProvider);

    switch (currentTool.idx) {
      case 3:
        specialWidget = const ColorLayout();
      case 4:
        specialWidget = const UndefinedLayout();
      default:
        specialWidget = FavoriteLayout(
          itemApply: listButtonClicked,
        );
    }

    return DefaultTextStyle(
      style: GoogleFonts.nanumMyeongjo(
          color: const Color.fromARGB(255, 0, 0, 0),
          fontSize: 12,
          fontWeight: FontWeight.w700),
      child: Column(
        children: [
          Row(
            children: [
              SearchBox(
                buttonClicked: listButtonClicked,
              ),
              const SizedBox(width: 8),
              const UndoAndRedo(
                  // undoImage: undoImage,
                  // redoImage: redoImage,
                  )
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
                          // const SizedBox(width: 8),
                          // SelectedItem(
                          //     currentCharacter: currentCharacter,
                          //     clickCloseButton: clickedClose,
                          //     subCategory: myToolList[currentToolIdx]
                          //         .subCategoryList![currentMenuIdx]),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                          child: ItemList(currentTool: currentTool
                              // buttonClicked: listButtonClicked,
                              // currentClickedItemIdx: clickedButtonIdx,
                              // currentToolIndex: currentToolIdx,
                              // currentMenuIndex: currentMenuIdx,
                              )),
                    ],
                  )
                : specialWidget,
          ),
        ],
      ),
    );
  }
}
