import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/data/color_palette.dart';
import 'package:maple_closet/models/skeleton_character.dart';

class ColorLayout extends StatefulWidget {
  final MyCharacter currentCharacter;
  final MyCharacter currentCharacter2;
  final Function applyButtonClicked;
  late int hairColorCharacter1;
  late int hairColorCharacter2;
  late int lensColorCharacter1;
  late int lensColorCharacter2;

  ColorLayout(
      {super.key,
      required this.currentCharacter,
      required this.currentCharacter2,
      required this.applyButtonClicked}) {
    hairColorCharacter1 = int.parse(currentCharacter.itemMap['Hair'][2]);
    hairColorCharacter2 = int.parse(currentCharacter2.itemMap['Hair'][2]);
    lensColorCharacter1 = int.parse(currentCharacter.itemMap['Face'][2]);
    lensColorCharacter2 = int.parse(currentCharacter2.itemMap['Face'][2]);
  }

  @override
  State<StatefulWidget> createState() {
    return _ColorLayout();
  }
}

class _ColorLayout extends State<ColorLayout> {
  void colorButtonClicked(String target, int character, int color) {
    setState(() {
      if (character == 1) {
        if (target == 'hair') {
          widget.hairColorCharacter1 = color;
        } else {
          widget.lensColorCharacter1 = color;
        }
      } else {
        if (target == 'hair') {
          widget.hairColorCharacter2 = color;
        } else {
          widget.lensColorCharacter2 = color;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('헤어', style: TextStyle(fontSize: 15)),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff2B3A55),
                      minimumSize: const Size(50, 35),
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () => widget.applyButtonClicked('hair',
                        widget.hairColorCharacter1, widget.hairColorCharacter2),
                    child: Text(
                      '적용',
                      style: GoogleFonts.nanumMyeongjo(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...hair.map(
                  (colorPick) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(colorPick[0]),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.width * 0.08),
                    ),
                    onPressed: () {
                      colorButtonClicked('hair', 1, colorPick[1]);
                    },
                    child: widget.hairColorCharacter1 == colorPick[1]
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...hair.map(
                  (colorPick) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(colorPick[0]),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.width * 0.08),
                    ),
                    onPressed: () {
                      colorButtonClicked('hair', 2, colorPick[1]);
                    },
                    child: widget.hairColorCharacter2 == colorPick[1]
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('렌즈', style: TextStyle(fontSize: 15)),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff2B3A55),
                      minimumSize: const Size(50, 35),
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () => widget.applyButtonClicked('lens',
                        widget.lensColorCharacter1, widget.lensColorCharacter2),
                    child: Text(
                      '적용',
                      style: GoogleFonts.nanumMyeongjo(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...lens.map(
                  (colorPick) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(colorPick[0]),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.width * 0.08),
                    ),
                    onPressed: () {
                      colorButtonClicked('lens', 1, colorPick[1]);
                    },
                    child: widget.lensColorCharacter1 == colorPick[1]
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...lens.map(
                  (colorPick) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(colorPick[0]),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.width * 0.08),
                    ),
                    onPressed: () {
                      colorButtonClicked('lens', 2, colorPick[1]);
                    },
                    child: widget.lensColorCharacter2 == colorPick[1]
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
