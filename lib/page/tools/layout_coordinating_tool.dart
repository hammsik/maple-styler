import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_Favorite.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';
import 'package:maple_closet/page/tools/layout_color.dart';
import 'package:maple_closet/widgets/layout_undifined.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';
import 'my_item_menu.dart';
import 'my_selected_item.dart';

class CoordinatingTools extends StatelessWidget {
  final Function listButtonClicked;
  final Function colorApplyButtonClicked;
  final int clickedButtonIdx;
  final Function clickedClose;
  final Function() undoImage;
  final Function() redoImage;
  final MyCharacter currentCharacter;
  final MyCharacter currentCharacter2;
  final int currentToolIdx;
  final int currentMenuIdx;
  final Function toolButtonClick;
  final Function menuButtonClick;

  const CoordinatingTools({
    super.key,
    required this.listButtonClicked,
    required this.colorApplyButtonClicked,
    required this.clickedButtonIdx,
    required this.clickedClose,
    required this.undoImage,
    required this.redoImage,
    required this.currentCharacter,
    required this.currentCharacter2,
    required this.currentToolIdx,
    required this.currentMenuIdx,
    required this.toolButtonClick,
    required this.menuButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    Widget specialWidget;

    if (currentToolIdx == 3) {
      specialWidget = ColorLayout(
        currentCharacter: currentCharacter,
        currentCharacter2: currentCharacter2,
        applyButtonClicked: colorApplyButtonClicked,
      );
    } else if (currentToolIdx == 4) {
      specialWidget = const UndefinedLayout();
    } else {
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
              UndoAndRedo(
                undoImage: undoImage,
                redoImage: redoImage,
              )
            ],
          ),
          const SizedBox(height: 8),
          MytoolButtons(
            toolList: myToolList,
            clickButtonIdx: currentToolIdx,
            buttonClicked: toolButtonClick,
          ),
          const SizedBox(height: 8),
          Flexible(
            fit: FlexFit.loose,
            child: currentToolIdx < 3
                ? Column(
                    children: [
                      Row(
                        children: [
                          ItemMenu(
                              currentTool: myToolList[currentToolIdx],
                              currentMenuIdx: currentMenuIdx,
                              buttonClicked: menuButtonClick),
                          const SizedBox(width: 8),
                          SelectedItem(
                              currentCharacter: currentCharacter,
                              clickCloseButton: clickedClose,
                              subCategory: myToolList[currentToolIdx]
                                  .menuList![currentMenuIdx][1]),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ItemList(
                            buttonClicked: listButtonClicked,
                            currentClickedItemIdx: clickedButtonIdx,
                            currentToolIndex: currentToolIdx,
                            currentMenuIndex: currentMenuIdx,
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
