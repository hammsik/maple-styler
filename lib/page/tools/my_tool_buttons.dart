import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class MytoolButtons extends ConsumerWidget {
  const MytoolButtons({
    // required this.toolList,
    // required this.buttonClicked,
    // required this.clickButtonIdx,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _buildToolButtonsWithGap(ref),
    );
  }

  List<Widget> _buildToolButtonsWithGap(WidgetRef ref) {
    final currentTool = ref.watch(toolSettingProvider);

    List<Widget> buttons = [];
    toolMap.forEach((key, value) {
      buttons.add(
        Expanded(
          child: GestureDetector(
            onTap: () => ref
                .read(toolSettingProvider.notifier)
                .changeTool(toolType: key),
            child: Container(
                alignment: Alignment.center,
                height: 35,
                decoration: BoxDecoration(
                  color: currentTool.toolType == value.toolType
                      ? const Color.fromARGB(255, 181, 103, 103)
                      : const Color.fromARGB(255, 230, 222, 218),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: key == ToolType.favorite
                    ? Icon(
                        Icons.favorite_rounded,
                        color: currentTool.toolType == value.toolType
                            ? const Color.fromARGB(255, 230, 222, 218)
                            : const Color.fromARGB(255, 181, 103, 103),
                      )
                    : Text(
                        value.toolNameKo,
                        style: TextStyle(
                            color: currentTool.toolType == value.toolType
                                ? Colors.white
                                : Colors.black),
                      )),
          ),
        ),
      );
      if (value.idx < toolMap.length - 1) {
        buttons.add(const SizedBox(width: 8)); // 간격 추가
      }
    });

    return buttons;
  }
}
