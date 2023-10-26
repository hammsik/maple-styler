import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maple_closet/api_maple_io.dart';

class ItemList extends StatefulWidget {
  final String categoryFilter;
  final String subCategoryFilter;
  final Function buttonClicked;
  final int currentClickedItemIdx;

  ItemList({
    super.key,
    required this.categoryFilter,
    required this.subCategoryFilter,
    required this.buttonClicked,
    required this.currentClickedItemIdx,
  });

  @override
  State<StatefulWidget> createState() {
    return _ItemList();
  }
}

class _ItemList extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    print(widget.currentClickedItemIdx);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12), bottom: Radius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              FutureBuilder<List<List<dynamic>>>(
                future: APIPractice.getSomething(
                    widget.categoryFilter, widget.subCategoryFilter),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                      delegate: SliverChildListDelegate(
                        [const Text('error!')],
                      ),
                    );
                  } else if (!snapshot.hasData) {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1),
                      delegate: SliverChildListDelegate(
                        [const Center(child: CircularProgressIndicator())],
                      ),
                    );
                  } else {
                    return SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 3.0,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        childCount: snapshot.data?.length,
                        (context, index) => FilledButton(
                          style: FilledButton.styleFrom(
                            foregroundColor: Colors.black.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size.zero,
                            padding: EdgeInsets.all(0),
                            backgroundColor:
                                widget.currentClickedItemIdx == index
                                    ? Color.fromARGB(255, 240, 240, 240)
                                    : Color.fromARGB(255, 201, 191, 191),
                          ),
                          onPressed: () => widget.buttonClicked(
                              widget.subCategoryFilter,
                              snapshot.data?[index][0],
                              index),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Image.network(
                                  'https://maplestory.io/api/KMST/1157/item/${snapshot.data?[index][0]}/icon',
                                ),
                              ),
                              SizedBox(width: 5),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  // color: Color.fromARGB(255, 230, 222, 218),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                width: 95,
                                height: double.infinity,
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  snapshot.data?[index][1],
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
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
