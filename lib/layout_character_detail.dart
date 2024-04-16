import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maple_closet/database/database.dart';

class CharacterDetailScreen extends StatefulWidget {
  final UserFavoriteCharacter favoriteCharacter;
  final int listIndex;
  final Function characterApply;

  const CharacterDetailScreen(
      {super.key,
      required this.favoriteCharacter,
      required this.listIndex,
      required this.characterApply});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteDetailScreen();
  }
}

class _FavoriteDetailScreen extends State<CharacterDetailScreen> {
  final database = UserFavoriteDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: SafeArea(
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 230, 222, 218),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              width: 250,
              padding: const EdgeInsets.all(14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              int deleteCnt = await (database
                                      .delete(database.userFavoriteCharacters)
                                    ..where((item) => item.id
                                        .equals(widget.favoriteCharacter.id)))
                                  .go();
                              Fluttertoast.showToast(
                                msg: "해당 코디가 목록에서 삭제되었습니다.",
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: const Color(0xff6E6E6E),
                                fontSize: 20,
                              );
                              Navigator.pop(context, deleteCnt);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 89, 77),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              '삭제하기',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              widget.characterApply(widget.favoriteCharacter);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 121, 230, 121),
                              // border을 각지게
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              '불러오기',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        // width가 부모의 width에 맞게
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      child: const Text('닫기',
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
          ),
          IgnorePointer(
            child: Container(
              alignment: Alignment.center,
              height: 670,
              child: Hero(
                tag: widget.listIndex,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      widget.favoriteCharacter.characterImageUrl1,
                      fit: BoxFit.none,
                    ),
                    Opacity(
                      opacity: 0.5,
                      child: Image.network(
                        widget.favoriteCharacter.characterImageUrl2,
                        fit: BoxFit.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
