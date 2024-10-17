import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/skeleton_tools.dart';
import 'package:maple_closet/providers/character_equipment_provider.dart';
import 'package:maple_closet/providers/item_provider.dart';
import 'package:maple_closet/widgets/custom_scrollbar_wrapper.dart';

class ItemList extends ConsumerWidget {
  final Function buttonClicked;
  final int currentClickedItemIdx;
  final int currentToolIndex;
  final int currentMenuIndex;

  const ItemList({
    super.key,
    required this.buttonClicked,
    required this.currentClickedItemIdx,
    required this.currentToolIndex,
    required this.currentMenuIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = ScrollController();

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12), bottom: Radius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
        child: ref.watch(mapleItemListProvider).when(
              data: (list) {
                final itemList = list[currentToolIndex][currentMenuIndex];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomScrollbarWrapper(
                    // itemCount: itemList.length,
                    scrollController: scrollController,
                    child: CustomScrollView(
                      controller: scrollController,
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
                                side: currentClickedItemIdx == index
                                    ? BorderSide(
                                        width: 2,
                                        color: const Color.fromARGB(
                                                255, 85, 56, 43)
                                            .withOpacity(0.5),
                                      )
                                    : null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size.zero,
                                padding: const EdgeInsets.all(0),
                                backgroundColor: currentClickedItemIdx == index
                                    ? const Color.fromARGB(255, 238, 238, 238)
                                    : const Color.fromARGB(255, 201, 191, 191),
                              ),
                              onPressed: () {
                                // buttonClicked(itemList[index], index);
                                ref
                                    .read(characterEquipmentProvider.notifier)
                                    .updateEquipment(item: itemList[index]);
                              },
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 35,
                                    child: Image.network(
                                      'https://maplestory.io/api/KMS/389/item/${itemList[index].id}/icon',
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                        itemList[index].name,
                                        style: GoogleFonts.nanumMyeongjo(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
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
                );
              },
              error: (error, stackTrace) => Center(
                child: Text('에러가 발생했습니다. 에러코드: ${error.toString()}'),
              ),
              loading: () => const Center(
                  child: SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator())),
            ),
      ),
    );
  }
}
