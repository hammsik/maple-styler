import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/equipment.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/page/character/layout_character_detail.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/favorite_character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/providers/toast_provider.dart';

class CharacterDetail extends ConsumerWidget {
  const CharacterDetail({super.key});

  List<Item> makeWearingItemList(Equipment currentCharacter) {
    List<Item> itemList = [currentCharacter.head];

    if (currentCharacter.hair != null) itemList.add(currentCharacter.hair!);
    if (currentCharacter.face != null) itemList.add(currentCharacter.face!);
    if (currentCharacter.hat != null) itemList.add(currentCharacter.hat!);
    if (currentCharacter.overAll != null)
      itemList.add(currentCharacter.overAll!);
    if (currentCharacter.cash != null) itemList.add(currentCharacter.cash!);
    if (currentCharacter.top != null) itemList.add(currentCharacter.top!);
    if (currentCharacter.bottom != null) itemList.add(currentCharacter.bottom!);
    if (currentCharacter.cape != null) itemList.add(currentCharacter.cape!);
    if (currentCharacter.glove != null) itemList.add(currentCharacter.glove!);
    if (currentCharacter.shoes != null) itemList.add(currentCharacter.shoes!);
    if (currentCharacter.shield != null) itemList.add(currentCharacter.shield!);
    if (currentCharacter.faceAccessory != null)
      itemList.add(currentCharacter.faceAccessory!);
    if (currentCharacter.eyeDecoration != null)
      itemList.add(currentCharacter.eyeDecoration!);
    if (currentCharacter.earrings != null)
      itemList.add(currentCharacter.earrings!);

    return itemList;
  }

  // void replaceCurrentCharacter(UserFavoriteCharacter selectedCharacter) {
  //   setState(() {
  //     widget.dodo.itemMap = json.decode(selectedCharacter.characterInfo);
  //     widget.dodo2.itemMap = json.decode(selectedCharacter.characterInfo2);
  //     widget.dodo.addItem();
  //     widget.dodo2.addItem();
  //     makeWearingItemList();
  //   });
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    ref.watch(characterProvider);
    final characterImageList = ref
        .read(characterProvider.notifier)
        .getCurrentCharacterImageAsUint(at: ActionType.stand1);
    final characterUrls = ref
        .read(characterProvider.notifier)
        .getCurrentCharacterURL(ActionType.stand1);

    final Equipment currentCharacter =
        ref.read(characterProvider.notifier).getCurrentCharacter();
    final List<Item> currentWearingItemList =
        makeWearingItemList(currentCharacter);

    final userFavoriteDB = UserFavoriteDataBase();

    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.85),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      width: 32,
                                      height: 32,
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "장착 아이템",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
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
                                        childCount:
                                            currentWearingItemList.length,
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
                                                  'https://maplestory.io/api/KMS/389/item/${currentWearingItemList[index].id}/icon',
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
                                                    currentWearingItemList[
                                                            index]
                                                        .name,
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
                                      child: FutureBuilder(
                                        future:
                                            characterImageList, // 이미지를 불러오는 Future
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                                  ConnectionState.done &&
                                              snapshot.hasData) {
                                            return Stack(
                                                fit: StackFit.expand,
                                                children: [
                                                  Image.memory(
                                                    snapshot.data![0],
                                                    fit: BoxFit.none,
                                                  ),
                                                  Opacity(
                                                    opacity: 0.5,
                                                    child: Image.memory(
                                                      snapshot.data![1],
                                                      fit: BoxFit.none,
                                                    ),
                                                  ),
                                                ]);
                                          } else {
                                            return Image.asset(
                                                'assets/drummingBunny.gif'); // 로딩 중일 때 표시할 위젯
                                          }
                                        },
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
                                          characterInfo: currentCharacter
                                              .customToJson(isOne: true),
                                          characterInfo2: currentCharacter
                                              .customToJson(isOne: false),
                                          characterImageUrl1: characterUrls[0],
                                          characterImageUrl2: characterUrls[1],
                                        ));
                                    ref.invalidate(
                                        favoriteCharacterListProvider);
                                    ref
                                        .read(customToastProvider.notifier)
                                        .showCustomToast(context,
                                            type: ToastType.success,
                                            message: "코디가 저장되었습니다.");
                                    try {
                                      scrollController.jumpTo(scrollController
                                          .position.maxScrollExtent);
                                    } catch (e) {
                                      print(e);
                                    }
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
                  child:
                      FavoriteCharacterList(scrollController: scrollController),
                ),
              ],
            ),
          ),
        ));
  }
}

class FavoriteCharacterList extends ConsumerWidget {
  final ScrollController scrollController;

  const FavoriteCharacterList({super.key, required this.scrollController});

  Future<bool> openFavoriteCharacterDetail(BuildContext context,
      UserFavoriteCharacter selectedCharacter, int listIndex) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CharacterDetailScreen(
          favoriteCharacter: selectedCharacter,
          listIndex: listIndex,
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

    if (result != null && result > 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
              child: ref.watch(favoriteCharacterListProvider).when(
                  data: (favoriteCharacterList) => favoriteCharacterList.isEmpty
                      ? const Center(child: Text('저장한 코디가 존재하지 않습니다'))
                      : CustomScrollView(
                          controller: scrollController,
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
                                childCount: favoriteCharacterList.length,
                                (context, index) => FilledButton(
                                  style: FilledButton.styleFrom(
                                    foregroundColor:
                                        Colors.black.withOpacity(0.3),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: const Color.fromARGB(
                                        255, 201, 191, 191),
                                  ),
                                  onPressed: () async {
                                    bool isDeleted =
                                        await openFavoriteCharacterDetail(
                                            context,
                                            favoriteCharacterList[index],
                                            index - 1000);
                                    if (isDeleted) {
                                      ref.invalidate(
                                          favoriteCharacterListProvider);
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Hero(
                                      tag: index - 1000,
                                      // child: FutureBuilder(
                                      //   future: ref
                                      //       .read(apiProvider.notifier)
                                      //       .getCharacterImage([
                                      //     favoriteCharacterList[index]
                                      //         .characterImageUrl1,
                                      //     favoriteCharacterList[index]
                                      //         .characterImageUrl2
                                      //   ]),
                                      //   builder: (context, snapshot) {
                                      //     if (snapshot.connectionState ==
                                      //             ConnectionState.done &&
                                      //         snapshot.hasData) {
                                      //       return Stack(
                                      //           fit: StackFit.expand,
                                      //           children: [
                                      //             Image.memory(
                                      //               snapshot.data![0],
                                      //               fit: BoxFit.none,
                                      //             ),
                                      //             Opacity(
                                      //               opacity: 0.5,
                                      //               child: Image.memory(
                                      //                 snapshot.data![1],
                                      //                 fit: BoxFit.none,
                                      //               ),
                                      //             ),
                                      //           ]);
                                      //     } else {
                                      //       return Image.asset(
                                      //           'assets/drummingBunny.gif'); // 로딩 중일 때 표시할 위젯
                                      //     }
                                      //   },
                                      // ),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.network(
                                            favoriteCharacterList[index]
                                                .characterImageUrl1,
                                            fit: BoxFit.none,
                                          ),
                                          Opacity(
                                            opacity: 0.5,
                                            child: Image.network(
                                              favoriteCharacterList[index]
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
                            ),
                          ],
                        ),
                  error: (error, stackTrace) =>
                      Center(child: Text('오류가 발생했습니다.\nError: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ),
          ),
          // builder: (context, snapshot) {
          //   if (snapshot.connectionState ==
          //       ConnectionState.waiting) {
          //     return const Center(
          //         child: CircularProgressIndicator());
          //   } else if (snapshot.hasError) {
          //     return
          //   } else if (!snapshot.hasData ||
          //       snapshot.data!.isEmpty) {
          //     return
          //   } else {
          //     final favoriteCharacterList = snapshot.data!;
          //     return
          //   }
          // },
        ),
      ],
    );
  }
}
