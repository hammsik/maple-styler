import 'package:flutter/material.dart';
import 'package:maple_closet/data/colorPalette.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';

class ColorLayout extends StatefulWidget {
  final MyCharacter currentCharacter;
  final MyCharacter currentCharacter2;
  final Function colorButtonClicked;

  const ColorLayout(
      {super.key,
      required this.currentCharacter,
      required this.currentCharacter2,
      required this.colorButtonClicked});

  @override
  State<StatefulWidget> createState() {
    return _ColorLayout();
  }
}

class _ColorLayout extends State<ColorLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('헤어'),
        const SizedBox(height: 20),
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
                  widget.colorButtonClicked(colorPick[1], 1, 'hair');
                  setState(() {});
                },
                child: widget.currentCharacter.currentHairColor ==
                        colorPick[1].toString()
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
                  widget.colorButtonClicked(colorPick[1], 2, 'hair');
                  setState(() {});
                },
                child: widget.currentCharacter2.currentHairColor ==
                        colorPick[1].toString()
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 50),
        const Text('렌즈'),
        const SizedBox(height: 20),
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
                  widget.colorButtonClicked(colorPick[1], 1, 'lens');
                  setState(
                    () {},
                  );
                },
                child: widget.currentCharacter.currentLensColor ==
                        colorPick[1].toString()
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
                  widget.colorButtonClicked(colorPick[1], 2, 'lens');
                  setState(
                    () {},
                  );
                },
                child: widget.currentCharacter2.currentLensColor ==
                        colorPick[1].toString()
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
