import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/providers/toast_provider.dart';

class SelectedItem extends ConsumerWidget {
  const SelectedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDB = UserFavoriteDataBase();
    final currentTool = ref.watch(toolSettingProvider);
    final currentSubCategory =
        currentTool.subCategoryList![currentTool.subCategoryIdx!];

    Item? selectedItem = ref
        .watch(characterProvider.notifier)
        .getCurrentItemBySubCategory(type: currentSubCategory.type);

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 222, 218),
          borderRadius: BorderRadius.circular(8),
        ),
        child: selectedItem == null
            ? const Text('아이템을 선택해주세요')
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    'https://maplestory.io/api/KMS/389/item/${selectedItem.id}/icon',
                    width: 25,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_outlined);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(selectedItem.name,
                          style: const TextStyle(fontSize: 9))),
                  const SizedBox(
                    width: 8,
                  ),
                  FilledButton(
                      onPressed: () async {
                        final matchingItems =
                            await (userDB.select(userDB.userFavoriteItems)
                                  ..where((tbl) => tbl.itemid
                                      .equals(int.parse(selectedItem.id))))
                                .get();

                        if (matchingItems.isEmpty) {
                          userDB
                              .into(userDB.userFavoriteItems)
                              .insert(UserFavoriteItemsCompanion.insert(
                                itemid: int.parse(selectedItem.id),
                                name: selectedItem.name,
                                subCategory: currentSubCategory.nameEn,
                              ));
                          ref
                              .read(customToastProvider.notifier)
                              .showCustomToast(context,
                                  type: ToastType.success,
                                  message: "아이템이 찜 목록에 추가되었습니다.");
                        } else {
                          ref
                              .read(customToastProvider.notifier)
                              .showCustomToast(context,
                                  type: ToastType.error,
                                  message: "이미 찜한 아이템입니다.");
                        }
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: const Color(0x00FFFFFF),
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
                  if (currentSubCategory.type != SubCategoryType.head)
                    FilledButton(
                      onPressed: () => ref
                          .read(characterProvider.notifier)
                          .takeOffEquipment(
                              subCategoryType: currentSubCategory.type),
                      style: FilledButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 60, 58, 78),
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
