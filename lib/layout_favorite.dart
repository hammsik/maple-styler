import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/layout_favorite_detail.dart';

class FavoriteLayout extends StatefulWidget {
  final Function itemApply;

  const FavoriteLayout({super.key, required this.itemApply});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteLayout();
  }
}

class _FavoriteLayout extends State<FavoriteLayout> {
  final favoriteItemDB = UserFavoriteDataBase();
  List<UserFavoriteItem> itemList = [];

  @override
  void initState() {
    super.initState();
    initDB();
  }

  void initDB() async {
    List<UserFavoriteItem> tmpItemList =
        await favoriteItemDB.select(favoriteItemDB.userFavoriteItems).get();
    setState(() => itemList = tmpItemList);
  }

  void openFavoriteDetail(BuildContext context, UserFavoriteItem selectedItem,
      int listIndex) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FavoriteDetailScreen(
          favoriteItem: selectedItem,
          listIndex: listIndex,
          itemApply: widget.itemApply,
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
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12), bottom: Radius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: itemList.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  child: const Text('찜한 아이템이 존재하지 않습니다.', style: TextStyle()))
              : CustomScrollView(
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
                        childCount: itemList.length,
                        (context, index) => FilledButton(
                          style: FilledButton.styleFrom(
                            foregroundColor: Colors.black.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.all(0),
                            backgroundColor:
                                const Color.fromARGB(255, 201, 191, 191),
                          ),
                          onPressed: () => openFavoriteDetail(
                              context, itemList[index], index),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Hero(
                                  tag: index,
                                  child: Image.network(
                                    'https://maplestory.io/api/KMS/389/item/${itemList[index].itemid}/icon',
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                          Icons.image_not_supported_outlined);
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  // color: Color.fromARGB(255, 230, 222, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 100,
                                height: double.infinity,
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  itemList[index].name,
                                  style: GoogleFonts.nanumMyeongjo(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
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
      ),
    );
  }
}
