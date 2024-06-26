import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatefulWidget {
  final List<dynamic> itemList;
  final Function buttonClicked;
  final int currentClickedItemIdx;

  const ItemList({
    super.key,
    required this.itemList,
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
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 5.0,
                  crossAxisSpacing: 5.0,
                  childAspectRatio: 3.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: widget.itemList.length,
                  (context, index) => FilledButton(
                    style: FilledButton.styleFrom(
                      foregroundColor: Colors.black.withOpacity(0.3),
                      side: widget.currentClickedItemIdx == index
                          ? BorderSide(
                              width: 2,
                              color: const Color.fromARGB(255, 85, 56, 43)
                                  .withOpacity(0.5),
                            )
                          : null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.all(0),
                      backgroundColor: widget.currentClickedItemIdx == index
                          ? const Color.fromARGB(255, 238, 238, 238)
                          : const Color.fromARGB(255, 201, 191, 191),
                    ),
                    onPressed: () =>
                        widget.buttonClicked(widget.itemList[index], index),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 35,
                          child: Image.network(
                            'https://maplestory.io/api/KMS/389/item/${widget.itemList[index].itemid}/icon',
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
                              widget.itemList[index].name,
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
          ),
        ),
      ),
    );
  }
}
