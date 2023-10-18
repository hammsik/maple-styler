import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maple_closet/data/myTools.dart';
import 'package:maple_closet/layout_ask.dart';
import 'package:maple_closet/layout_color.dart';
import 'package:maple_closet/layout_download.dart';
import 'my_search_box.dart';
import 'my_tool_buttons.dart';
import 'my_undo_and_redo.dart';
import 'my_item_list.dart';
import 'my_item_menu.dart';
import 'my_selected_item.dart';

class CoordinatingTools extends StatefulWidget {
  const CoordinatingTools({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CoordinatingTools();
  }
}

class _CoordinatingTools extends State<CoordinatingTools> {
  int currentToolIdx = 0;

  void toolButtonClikced(int toolIdx) {
    setState(() {
      currentToolIdx = toolIdx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: GoogleFonts.nanumMyeongjo(
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 12,
          fontWeight: FontWeight.w700),
      child: Column(
        children: [
          Row(
            children: [SearchBox(), SizedBox(width: 8), UndoAndRedo()],
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SelectedItem(),
                          SizedBox(width: 8),
                          ItemMenu(
                            currentTool: myToolList[currentToolIdx],
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Flexible(fit: FlexFit.loose, child: ItemList()),
                    ],
                  )
                : AskLayout(),
          ),
        ],
      ),
    );
  }
}
