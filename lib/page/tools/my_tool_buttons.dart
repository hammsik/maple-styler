import 'package:flutter/material.dart';
import 'package:maple_closet/models/skeleton_tools.dart';

class MytoolButtons extends StatefulWidget {
  final List<MyTool> toolList;
  final Function buttonClicked;
  final int clickButtonIdx;

  const MytoolButtons(
      {required this.toolList,
      required this.buttonClicked,
      required this.clickButtonIdx,
      super.key});

  @override
  State<StatefulWidget> createState() {
    return _MytoolButtons();
  }
}

class _MytoolButtons extends State<MytoolButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildToolButtonsWithGap(),
    );
  }

  List<Widget> _buildToolButtonsWithGap() {
    List<Widget> buttons = [];
    for (int i = 0; i < widget.toolList.length; i++) {
      buttons.add(
        Expanded(
          child: GestureDetector(
            onTap: () => widget.buttonClicked(widget.toolList[i].idx),
            child: Container(
              alignment: Alignment.center,
              height: 35,
              decoration: BoxDecoration(
                color: widget.clickButtonIdx == widget.toolList[i].idx
                    ? const Color.fromARGB(255, 181, 103, 103)
                    : const Color.fromARGB(255, 230, 222, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: widget.clickButtonIdx == widget.toolList[i].idx
                  ? widget.toolList[i].toolNameKo == '찜'
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Color.fromARGB(255, 230, 222, 218),
                        )
                      : Text(
                          widget.toolList[i].toolNameKo,
                          style: const TextStyle(color: Colors.white),
                        )
                  : widget.toolList[i].toolNameKo == '찜'
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Color.fromARGB(255, 181, 103, 103),
                        )
                      : Text(widget.toolList[i].toolNameKo),
            ),
          ),
        ),
      );
      if (i < widget.toolList.length - 1) {
        buttons.add(const SizedBox(width: 8)); // 간격 추가
      }
    }
    return buttons;
  }
}