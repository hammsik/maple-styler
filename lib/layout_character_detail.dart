import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';

class CharacterDetail extends StatefulWidget {
  final MyCharacter dodo;
  final MyCharacter dodo2;

  const CharacterDetail({required this.dodo, required this.dodo2, super.key});

  @override
  State<StatefulWidget> createState() {
    return _CharacterDetail();
  }
}

class _CharacterDetail extends State<CharacterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.85),
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "장착 아이템",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 230, 222, 218),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Hero(
                          tag: 'character',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Align(
                              alignment: Alignment.center,
                              child: Transform.scale(
                                scale: 2.0, // 확대 비율 설정
                                alignment: const Alignment(0, -0.3),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      widget.dodo.getMyCharacter(),
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Image.network(
                                          widget.dodo2.getMyCharacter()),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 230, 222, 218),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text('코디 저장하기',
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 222, 218),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(widget.dodo.getMyCharacter(rendermode: "1"))),
                ),
              ],
            ),
          ),
        ));
  }
}
