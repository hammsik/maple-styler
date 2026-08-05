import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/providers/toast_provider.dart';

// 팔레트
const _kAccent = Color.fromARGB(255, 181, 103, 103);
const _kSurface = Color.fromARGB(255, 230, 222, 218);
const _kMenuSurface = Color.fromARGB(255, 245, 240, 237);
const _kText = Color.fromARGB(255, 60, 48, 44);

class ItemMenu extends HookConsumerWidget {
  final MyTool currentTool;

  const ItemMenu({
    super.key,
    required this.currentTool,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SubCategory current =
        currentTool.subCategoryMap![currentTool.currentSubcategoryType]!;
    final controller = useMemoized(() => MenuController());

    return MenuAnchor(
      controller: controller,
      // 메뉴가 열린 상태에서 앵커/바깥을 탭하면 닫히고, 그 탭은 소비되어
      // 앵커 onTap이 다시 열지 않도록 한다.
      consumeOutsideTap: true,
      alignmentOffset: const Offset(0, 6),
      style: MenuStyle(
        alignment: Alignment.bottomLeft,
        backgroundColor: const WidgetStatePropertyAll(_kMenuSurface),
        elevation: const WidgetStatePropertyAll(6),
        shadowColor: WidgetStatePropertyAll(Colors.black.withOpacity(0.2)),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        final bool isOpen = controller.isOpen;
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: _kAccent.withOpacity(0.12),
            highlightColor: _kAccent.withOpacity(0.06),
            borderRadius: BorderRadius.circular(10),
            onTap: () => isOpen ? controller.close() : controller.open(),
            child: Ink(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _kSurface,
                border: Border.all(
                  color: isOpen ? _kAccent : Colors.transparent,
                  width: 1.4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        current.nameKo,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: 'Maplestory', 
                          color: _kText,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 180),
                      child: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 20,
                        color: _kAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      menuChildren: currentTool.subCategoryMap!.values.map((subCategory) {
        final bool isSelected =
            subCategory.type == currentTool.currentSubcategoryType;
        return _MenuRow(
          label: subCategory.nameKo,
          isSelected: isSelected,
          onTap: () {
            controller.close(); // 항목 선택 시 드롭다운 닫기
            ref.read(toolMapProvider.notifier).changeSubcategory(
                  toolType: currentTool.toolType,
                  subCategoryType: subCategory.type,
                );
            // 캐시무기 외 한손/두손무기는 외부 open API가 불안정해 렌더링이
            // 실패할 수 있으므로 사용자에게 경고를 띄운다.
            if (subCategory.type == SubCategoryType.oneHanded ||
                subCategory.type == SubCategoryType.twoHanded) {
              ref.read(customToastProvider.notifier).showCustomToast(
                    context,
                    type: ToastType.error,
                    message: '일부 무기는 렌더링되지 않을 수 있어요.',
                  );
            }
          },
        );
      }).toList(),
    );
  }
}

class _MenuRow extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _MenuRow({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: isSelected ? _kAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          splashColor: _kAccent.withOpacity(0.15),
          onTap: onTap,
          child: Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(fontFamily: 'Maplestory', 
                      color: isSelected ? Colors.white : _kText,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_rounded,
                      size: 16, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
