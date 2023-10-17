import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    ? const Color(0xffCE7777)
                    : const Color(0xffF2E5E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item.toolName,
                style: GoogleFonts.nanumMyeongjo(
                  color: widget.clickButtonIdx == item.idx
                      ? const Color(0xffF2E5E5)
                      : const Color(0xff000000),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
