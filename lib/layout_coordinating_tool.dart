import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_Favorite.dart';
import 'package:maple_closet/layout_color.dart';
import 'package:maple_closet/layout_undifined.dart';
import 'models/skeleton_myCharacter.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';
import 'my_item_menu.dart';
import 'my_selected_item.dart';

// ignore: must_be_immutable
class CoordinatingTools extends StatefulWidget {
  final Function listButtonClicked;
  final Function colorApplyButtonClicked;
  int clickedButtonIdx;
  final Function clickedClose;
  final Function() undoImage;
  final Function() redoImage;
  final MyCharacter currentCharacter;
  final MyCharacter currentCharacter2;
  final List<List<List<dynamic>>> itemList;
  int currentToolIdx;
  int currentMenuIdx;
  final Function toolButtonClick;
  final Function menuButtonClick;

  CoordinatingTools({
    super.key,
    required this.listButtonClicked,
    required this.colorApplyButtonClicked,
    required this.clickedButtonIdx,
    required this.clickedClose,
    required this.undoImage,
    required this.redoImage,
    required this.currentCharacter,
    required this.currentCharacter2,
    required this.itemList,
    required this.currentToolIdx,
    required this.currentMenuIdx,
    required this.toolButtonClick,
    required this.menuButtonClick,
  });

  @override
  State<StatefulWidget> createState() {
    return _CoordinatingTools();
  }
}

class _CoordinatingTools extends State<CoordinatingTools> {
  @override
  Widget build(BuildContext context) {
    Widget specialWidget;

    if (widget.currentToolIdx == 3) {
      specialWidget = ColorLayout(
        currentCharacter: widget.currentCharacter,
        currentCharacter2: widget.currentCharacter2,
        applyButtonClicked: widget.colorApplyButtonClicked,
      );
    } else if (widget.currentToolIdx == 4) {
      specialWidget = const UndefinedLayout();
    } else {
      specialWidget = FavoriteLayout(
        itemApply: widget.listButtonClicked,
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
                itemList: widget.itemList,
                buttonClicked: widget.listButtonClicked,
              ),
              const SizedBox(width: 8),
              UndoAndRedo(
                undoImage: widget.undoImage,
                redoImage: widget.redoImage,
              )
            ],
          ),
          const SizedBox(height: 8),
          MytoolButtons(
            toolList: myToolList,
            clickButtonIdx: widget.currentToolIdx,
            buttonClicked: widget.toolButtonClick,
          ),
          const SizedBox(height: 8),
          Flexible(
            fit: FlexFit.loose,
            child: widget.currentToolIdx < 3
                ? Column(
                    children: [
                      Row(
                        children: [
                          ItemMenu(
                              currentTool: myToolList[widget.currentToolIdx],
                              currentMenuIdx: widget.currentMenuIdx,
                              buttonClicked: widget.menuButtonClick),
                          const SizedBox(width: 8),
                          SelectedItem(
                              currentCharacter: widget.currentCharacter,
                              clickCloseButton: widget.clickedClose,
                              subCategory: myToolList[widget.currentToolIdx]
                                  .menuList![widget.currentMenuIdx][1]),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ItemList(
                            itemList: widget.itemList[widget.currentToolIdx]
                                [widget.currentMenuIdx],
                            buttonClicked: widget.listButtonClicked,
                            currentClickedItemIdx: widget.clickedButtonIdx,
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
