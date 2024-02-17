import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/skeleton_myCharacter.dart';

class SelectedItem extends StatefulWidget {
  final MyCharacter currentCharacter;
  final Function clickCloseButton;
  final String subCategory;

  const SelectedItem(
      {super.key,
      required this.currentCharacter,
      required this.clickCloseButton,
      required this.subCategory});

  @override
  State<StatefulWidget> createState() {
    return _SelectedItem();
  }
}

class _SelectedItem extends State<SelectedItem> {
  final userDB = UserFavoriteDataBase();

  @override
  Widget build(BuildContext context) {
    String targetItemId =
        widget.currentCharacter.itemMap[widget.subCategory][0];
    if (widget.subCategory == 'Hair') {
      targetItemId = targetItemId.replaceRange(4, 5, '0');
    } else if (widget.subCategory == 'Face') {
      targetItemId = targetItemId.replaceRange(2, 3, '0');
    }
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 222, 218),
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget.currentCharacter.itemMap[widget.subCategory][0] ==
                    'null' ||
                widget.currentCharacter.itemMap[widget.subCategory][0] ==
                    '1040036' ||
                widget.currentCharacter.itemMap[widget.subCategory][0] ==
                    '1060026'
            ? const Text('아이템을 선택해주세요')
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    'https://maplestory.io/api/KMST/1168/item/$targetItemId/icon',
                    width: 25,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_outlined);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                          widget.currentCharacter.itemMap[widget.subCategory]
                              [1],
                          style: const TextStyle(fontSize: 9))),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton(
                      onPressed: () async {
                        final matchingItems = await (userDB
                                .select(userDB.userFavoriteItems)
                              ..where((tbl) =>
                                  tbl.itemid.equals(int.parse(targetItemId))))
                            .get();

                        if (matchingItems.isEmpty) {
                          await userDB.into(userDB.userFavoriteItems).insert(
                              UserFavoriteItemsCompanion.insert(
                                  itemid: int.parse(targetItemId),
                                  name: widget.currentCharacter
                                      .itemMap[widget.subCategory][1],
                                  subCategory: widget.subCategory));
                          Fluttertoast.showToast(
                              msg:
                                  "등록완료: ${widget.currentCharacter.itemMap[widget.subCategory][1]}",
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: const Color(0xff6E6E6E),
                              fontSize: 20,
                              toastLength: Toast.LENGTH_SHORT);
                        } else {
                          Fluttertoast.showToast(
                              msg: "이미 찜한 아이템입니다.",
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: const Color(0xff6E6E6E),
                              fontSize: 20,
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      },
                      style: FilledButton.styleFrom(
                          // foregroundColor:
                          //     const Color.fromARGB(255, 60, 58, 78),
                          backgroundColor: const Color(0x00FFFFFF),
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(5)),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(0),
                          fixedSize: const Size(30, 30),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                      child: const Icon(
                        Icons.favorite_rounded,
                        color: Color.fromARGB(255, 181, 103, 103),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton(
                    onPressed: () =>
                        widget.clickCloseButton(widget.subCategory),
                    style: FilledButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 60, 58, 78),
                        backgroundColor:
                            const Color.fromARGB(255, 201, 191, 191),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.all(0),
                        fixedSize: const Size(30, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: const Icon(
                      Icons.close_rounded,
                      size: 20,
                    ),
                  ),
                  // child: const ,
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
      ),
    );
  }
}
