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
      children: [
        ...widget.toolList.map(
          (item) => GestureDetector(
            onTap: () => widget.buttonClicked(item.idx),
            child: Container(
              alignment: Alignment.center,
              width: 47,
              height: 35,
              decoration: BoxDecoration(
                color: widget.clickButtonIdx == item.idx
                    ? const Color.fromARGB(255, 181, 103, 103)
                    : const Color.fromARGB(255, 230, 222, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: widget.clickButtonIdx == item.idx
                  ? item.toolName_ko == '찜'
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                        )
                      : Text(
                          item.toolName_ko,
                          style: const TextStyle(color: Colors.white),
                        )
                  : item.toolName_ko == '찜'
                      ? const Icon(
                          Icons.favorite_rounded,
                          color: Color.fromARGB(255, 181, 103, 103),
                        )
                      : Text(item.toolName_ko),
            ),
          ),
        ),
      ],
    );
  }
}
