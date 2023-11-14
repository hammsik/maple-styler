import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_ask.dart';
import 'models/skeleton_myCharacter.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';
import 'my_item_menu.dart';
import 'my_selected_item.dart';

class CoordinatingTools extends StatefulWidget {
  final Function listButtonClicked;
  final Function clickedClose;
  final Function() undoImage;
  final Function() redoImage;
  String selectedItemId;
  String selectedItemName;
  final MyCharacter currentCharacter;
  int clickedButtonIdx;
  final List<List<List<dynamic>>> itemApiList;

  CoordinatingTools(
      {super.key,
      required this.listButtonClicked,
      required this.clickedButtonIdx,
      required this.selectedItemId,
      required this.selectedItemName,
      required this.currentCharacter,
      required this.clickedClose,
      required this.undoImage,
      required this.redoImage,
      required this.itemApiList});

  @override
  State<StatefulWidget> createState() {
    return _CoordinatingTools();
  }
}

class _CoordinatingTools extends State<CoordinatingTools> {
  int currentToolIdx = 0;
  int currentMenuIdx = 0;

  String subCategoryFilter_ko = myToolList[0].menuList![0][0];
  String subCategoryFilter_en = myToolList[0].menuList![0][1];

  void toolButtonClikced(int toolIdx) {
    setState(() {
      currentToolIdx = toolIdx;
      if (toolIdx < 3) {
        subCategoryFilter_ko = myToolList[toolIdx].menuList![0][0];
        subCategoryFilter_en = myToolList[toolIdx].menuList![0][1];
        widget.clickedButtonIdx = -1;
        widget.selectedItemId =
            widget.currentCharacter.itemMap[subCategoryFilter_en]![0];
        widget.selectedItemName =
            widget.currentCharacter.itemMap[subCategoryFilter_en]![1];
        currentMenuIdx = 0;
      }
    });
  }

  void menuItemClicked(String subCategoryFilter_ko, String subCategoryFilter_en,
      int currentMenuIdx) {
    setState(() {
      this.subCategoryFilter_ko = subCategoryFilter_ko;
      this.subCategoryFilter_en = subCategoryFilter_en;
      widget.clickedButtonIdx = -1;
      widget.selectedItemId =
          widget.currentCharacter.itemMap[subCategoryFilter_en]![0];
      widget.selectedItemName =
          widget.currentCharacter.itemMap[subCategoryFilter_en]![1];
      this.currentMenuIdx = currentMenuIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                itemList: widget.itemApiList,
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
            clickButtonIdx: currentToolIdx,
            buttonClicked: toolButtonClikced,
          ),
          const SizedBox(height: 8),
          Flexible(
            fit: FlexFit.loose,
            child: currentToolIdx < 3
                ? Column(
                    children: [
                      Row(
                        children: [
                          SelectedItem(
                              itemId: widget.selectedItemId,
                              itemName: widget.selectedItemName,
                              clickCloseButton: widget.clickedClose,
                              subCategory: subCategoryFilter_en),
                          const SizedBox(width: 8),
                          ItemMenu(
                              currentTool: myToolList[currentToolIdx],
                              currentMenuItem: subCategoryFilter_ko,
                              buttonClicked: menuItemClicked)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ItemList(
                            itemList: widget.itemApiList[
                                myToolList[currentToolIdx].cntIdx! +
                                    currentMenuIdx],
                            buttonClicked: widget.listButtonClicked,
                            currentClickedItemIdx: widget.clickedButtonIdx,
                            subCategoryFilter: subCategoryFilter_en,
                          )),
                    ],
                  )
                : const AskLayout(),
          ),
        ],
      ),
    );
  }
}
