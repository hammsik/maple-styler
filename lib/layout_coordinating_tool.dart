import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_download.dart';
import 'package:maple_closet/layout_favorite.dart';
import 'package:maple_closet/layout_color.dart';
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
  final Function colorButtonClicked;
  final Function clickedClose;
  final Function() undoImage;
  final Function() redoImage;
  final MyCharacter currentCharacter;
  final MyCharacter currentCharacter2;
  int clickedButtonIdx;
  final List<List<List<dynamic>>> itemList;

  CoordinatingTools(
      {super.key,
      required this.listButtonClicked,
      required this.colorButtonClicked,
      required this.clickedButtonIdx,
      required this.currentCharacter,
      required this.currentCharacter2,
      required this.clickedClose,
      required this.undoImage,
      required this.redoImage,
      required this.itemList});

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
      this.currentMenuIdx = currentMenuIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget specialWidget;

    if (currentToolIdx == 3) {
      specialWidget = ColorLayout(
        currentCharacter: widget.currentCharacter,
        currentCharacter2: widget.currentCharacter2,
        colorButtonClicked: widget.colorButtonClicked,
      );
    } else if (currentToolIdx == 4) {
      specialWidget = const DownloadLayout();
    } else {
      specialWidget = const FavoriteLayout();
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
                          ItemMenu(
                              currentTool: myToolList[currentToolIdx],
                              currentMenuItem: subCategoryFilter_ko,
                              buttonClicked: menuItemClicked),
                          const SizedBox(width: 8),
                          SelectedItem(
                              currentCharacter: widget.currentCharacter,
                              clickCloseButton: widget.clickedClose,
                              subCategory: subCategoryFilter_en),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(
                          fit: FlexFit.loose,
                          child: ItemList(
                            itemList: widget.itemList[currentToolIdx]
                                [currentMenuIdx],
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
