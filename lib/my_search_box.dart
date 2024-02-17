import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatefulWidget {
  final List<List<List<dynamic>>> itemList;
  final Function buttonClicked;

  const SearchBox(
      {super.key, required this.itemList, required this.buttonClicked});

  @override
  State<StatefulWidget> createState() {
    return _SearchBox();
  }
}

class _SearchBox extends State<SearchBox> {
  String searchedWord = '';

  void openSearchScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(
          itemList: widget.itemList,
          buttonClicked: widget.buttonClicked,
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

class DetailScreen extends StatefulWidget {
  final List<List<List<dynamic>>> itemList;
  final Function buttonClicked;
  final String searchedWord;

  const DetailScreen(
      {super.key,
      required this.itemList,
      required this.buttonClicked,
      required this.searchedWord});

  @override
  State<StatefulWidget> createState() {
    return _DetailScreen();
  }
}

class _DetailScreen extends State<DetailScreen> {
  TextEditingController myController = TextEditingController();
  Widget searchedList = const Center(
    child: Text(
      '검색된 아이템이 없습니다',
    ),
  );

  @override
  void initState() {
    myController.text = widget.searchedWord;
    myController.addListener(setItemList);
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void setItemList() {
    List<dynamic> searchedTmpList = [];
    for (int category = 0; category < widget.itemList.length; category++) {
      for (int subCategory = 0;
          subCategory < widget.itemList[category].length;
          subCategory++) {
        for (int item = 0;
            item < widget.itemList[category][subCategory].length;
            item++) {
          if (myController.text.isNotEmpty &&
              (widget.itemList[category][subCategory][item].name
                      .replaceAll(' ', ''))
                  .contains(myController.text.replaceAll(' ', ''))) {
            searchedTmpList.add(widget.itemList[category][subCategory][item]);
          }
        }
      }
    }

    setState(
      () {
        searchedList = searchedTmpList.isEmpty
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
                      childCount: searchedTmpList.length,
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
                          Navigator.pop(context, myController.text);
                          widget.buttonClicked(searchedTmpList[index], -2);
                        },
                        child: Row(
                          children: [
                            const SizedBox(width: 10),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Image.network(
                                'https://maplestory.io/api/KMST/1168/item/${searchedTmpList[index].id}/icon',
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                      Icons.image_not_supported_outlined);
                                },
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
                                searchedTmpList[index].name,
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
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
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
