import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/layout_character_detail.dart';
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
  final userFavoriteDB = UserFavoriteDataBase();
  List<List<dynamic>> characterItemList = [];
  List<UserFavoriteCharacter> characterList = [];

  @override
  void initState() {
    super.initState();
    makeWearingItemList();
    initDB();
  }

  void initDB() async {
    List<UserFavoriteCharacter> tmpCharacterList = await userFavoriteDB
        .select(userFavoriteDB.userFavoriteCharacters)
        .get();
    setState(() => characterList = tmpCharacterList);
  }

  void makeWearingItemList() {
    List<List<dynamic>> tmpList = [];
    final characterItemMap = widget.dodo.itemMap;
    for (var entry in characterItemMap.entries) {
      final item = characterItemMap[entry.key];
      var tmpItemId = item[0];
      if (entry.key != 'Body' &&
          item[0] != 'null' &&
          item[0] != '1040036' &&
          item[0] != '1060026') {
        if (entry.key == 'Hair') {
          tmpItemId = item[0].replaceRange(4, 5, '0');
        } else if (entry.key == 'Face') {
          tmpItemId = item[0].replaceRange(2, 3, '0');
        }
        tmpList.add([tmpItemId, item[1]]);
      }
    }

    setState(() => characterItemList = tmpList);
  }

  void replaceCurrentCharacter(UserFavoriteCharacter selectedCharacter) {
    setState(() {
      widget.dodo.itemMap = json.decode(selectedCharacter.characterInfo1);
      widget.dodo2.itemMap = json.decode(selectedCharacter.characterInfo2);
      widget.dodo.addItem();
      widget.dodo2.addItem();
      makeWearingItemList();
    });
  }

  void openFavoriteCharacterDetail(BuildContext context,
      UserFavoriteCharacter selectedCharacter, int listIndex) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CharacterDetailScreen(
          favoriteCharacter: selectedCharacter,
          listIndex: listIndex,
          characterApply: replaceCurrentCharacter,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // 페이드 인 애니메이션을 적용
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        opaque: false,
      ),
    );

    print(result);
    if (result != null && result > 0) {
      initDB();
    }
  }

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
                  height: 260,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              padding: const EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CustomScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  slivers: <Widget>[
                                    SliverGrid(
                                      gridDelegate:
                                          const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200.0,
                                        mainAxisSpacing: 5.0,
                                        crossAxisSpacing: 5.0,
                                        childAspectRatio: 3.0,
                                      ),
                                      delegate: SliverChildBuilderDelegate(
                                        childCount: characterItemList.length,
                                        (context, index) => Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 201, 191, 191),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 35,
                                                child: Image.network(
                                                  'https://maplestory.io/api/KMS/389/item/${characterItemList[index][0]}/icon',
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Icon(Icons
                                                        .image_not_supported_outlined);
                                                  },
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Expanded(
                                                child: Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  decoration: BoxDecoration(
                                                    // color: Color.fromARGB(255, 230, 222, 218),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  child: Text(
                                                    characterItemList[index][1],
                                                    style: GoogleFonts
                                                        .nanumMyeongjo(
                                                            color: const Color
                                                                .fromARGB(
                                                                255, 0, 0, 0),
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Hero(
                              tag: 'character',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: SizedBox(
                                  height: 200,
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
                            const SizedBox(height: 10),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await userFavoriteDB
                                        .into(userFavoriteDB
                                            .userFavoriteCharacters)
                                        .insert(UserFavoriteCharactersCompanion
                                            .insert(
                                          characterInfo1:
                                              json.encode(widget.dodo.itemMap),
                                          characterInfo2:
                                              json.encode(widget.dodo2.itemMap),
                                          characterImageUrl1:
                                              widget.dodo.getMyCharacter(),
                                          characterImageUrl2:
                                              widget.dodo2.getMyCharacter(),
                                        ));
                                    Fluttertoast.showToast(
                                        msg: "코디가 저장되었습니다!",
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor:
                                            const Color(0xff6E6E6E),
                                        fontSize: 20,
                                        toastLength: Toast.LENGTH_SHORT);
                                    initDB();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 230, 222, 218),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.save_rounded,
                                          color: Colors.black),
                                      SizedBox(width: 10),
                                      Text('코디 저장하기',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text(
                      //   "코디 저장 목록",
                      //   style: TextStyle(color: Colors.white, fontSize: 18),
                      // ),
                      // const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 230, 222, 218),
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: characterList.isEmpty
                                ? Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: const Text('저장한 코디가 존재하지 않습니다',
                                        style: TextStyle()),
                                  )
                                : CustomScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    slivers: <Widget>[
                                      SliverGrid(
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 120.0,
                                          mainAxisSpacing: 10.0,
                                          crossAxisSpacing: 10.0,
                                          childAspectRatio: 0.8,
                                        ),
                                        delegate: SliverChildBuilderDelegate(
                                          childCount: characterList.length,
                                          (context, index) => FilledButton(
                                            style: FilledButton.styleFrom(
                                              foregroundColor:
                                                  Colors.black.withOpacity(0.3),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              minimumSize: Size.zero,
                                              padding: const EdgeInsets.all(0),
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 201, 191, 191),
                                            ),
                                            // onPressed: () => openFavoriteDetail(
                                            //     context, characterList[index], index),
                                            onPressed: () =>
                                                openFavoriteCharacterDetail(
                                                    context,
                                                    characterList[index],
                                                    index - 1000),
                                            child: Hero(
                                              tag: index - 1000,
                                              child: Stack(
                                                children: [
                                                  Image.network(
                                                    characterList[index]
                                                        .characterImageUrl1,
                                                    fit: BoxFit.none,
                                                  ),
                                                  Opacity(
                                                    opacity: 0.5,
                                                    child: Image.network(
                                                      characterList[index]
                                                          .characterImageUrl2,
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
