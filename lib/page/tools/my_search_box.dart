import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/item_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class SearchBox extends ConsumerStatefulWidget {
  const SearchBox({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBoxState();
}

class _SearchBoxState extends ConsumerState<SearchBox> {
  String searchedWord = '';

  void openSearchScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(
          searchedWord: searchedWord,
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

    if (result != null) {
      setState(() => searchedWord = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () => openSearchScreen(context),
        style: FilledButton.styleFrom(
            minimumSize: Size.zero,
            fixedSize: const Size(20, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: const Color.fromARGB(255, 230, 222, 218),
            foregroundColor: Colors.black),
        child: Row(children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.search_rounded,
            size: 25,
            color: Colors.black,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            searchedWord,
            style: GoogleFonts.nanumMyeongjo(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.end,
          )),
          const SizedBox(
            width: 20,
          ),
        ]),
      ),
    );
  }
}

class DetailScreen extends ConsumerStatefulWidget {
  final String searchedWord;

  const DetailScreen({super.key, required this.searchedWord});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  TextEditingController myController = TextEditingController();

  Widget searchedList = const Center(
    child: Text(
      '검색된 아이템이 없습니다',
    ),
  );

  @override
  void initState() {
    myController.text = widget.searchedWord;
    myController.addListener(() => setItemList());
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void setItemList() {
    final itemList = ref.watch(mapleItemListProvider);
    itemList.when(
        data: (data) => showItemList(itemMap: data),
        error: (error, stacktrace) => setState(() => searchedList =
            Center(child: Text('에러가 발생했습니다. 에러코드: ${error.toString()}'))),
        loading: () {});
  }

  void showItemList(
      {required Map<ToolType, Map<SubCategoryType, List<dynamic>>> itemMap}) {
    final List<Item> searchedItemList = [];

    for (final categoryEntry in itemMap.entries) {
      if (categoryEntry.key == ToolType.weapon) {
        for (final weaponCategory in categoryEntry.value.values) {
          for (final subCategory in weaponCategory) {
            for (final item in subCategory) {
              if (myController.text.isNotEmpty &&
                  (item.name.replaceAll(' ', ''))
                      .contains(myController.text.replaceAll(' ', ''))) {
                searchedItemList.add(item);
              }
            }
          }
        }
      }

      for (final subCategory in categoryEntry.value.values) {
        for (final item in subCategory) {
          if (myController.text.isNotEmpty &&
              (item.name.replaceAll(' ', ''))
                  .contains(myController.text.replaceAll(' ', ''))) {
            searchedItemList.add(item);
          }
        }
      }
    }

    setState(
      () {
        searchedList = searchedItemList.isEmpty
            ? Center(
                child: Text(
                '검색된 아이템이 없습니다',
                style: GoogleFonts.nanumMyeongjo(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ))
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
                      childCount: searchedItemList.length,
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
                        onPressed: () {
                          ref
                              .read(characterProvider.notifier)
                              .updateEquipment(item: searchedItemList[index]);

                          ref.read(toolMapProvider.notifier).changeSubcategory(
                              toolType: ref
                                  .read(toolMapProvider)
                                  .values
                                  .firstWhere((e) => (e.subCategoryMap ?? {})
                                      .containsKey(searchedItemList[index]
                                          .subCategoryType))
                                  .toolType,
                              subCategoryType:
                                  searchedItemList[index].subCategoryType);
                          Navigator.pop(context, myController.text);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 35,
                              child: Image.network(
                                'https://maplestory.io/api/KMS/389/item/${searchedItemList[index].id}/icon',
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                      Icons.image_not_supported_outlined);
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  // color: Color.fromARGB(255, 230, 222, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  searchedItemList[index].name,
                                  style: GoogleFonts.nanumMyeongjo(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, dynamic) {
        if (didPop) {
          return;
        }
        Navigator.pop(context, myController.text);
      },
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 230, 222, 218),
                        ),
                        child: IconButton(
                          onPressed: () =>
                              Navigator.pop(context, myController.text),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 222, 218),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            controller: myController,
                            autofocus: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefix: const SizedBox(width: 10),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  myController.clear();
                                },
                                icon:
                                    const Icon(Icons.highlight_remove_rounded),
                              ),
                              hintText: '아이템 이름 검색',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12), bottom: Radius.circular(18)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 230, 222, 218),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                              bottom: Radius.circular(18)),
                          child: searchedList),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
