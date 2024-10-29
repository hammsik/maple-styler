import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class MytoolButtons extends ConsumerWidget {
  final MyTool currentTool;

  const MytoolButtons({
    required this.currentTool,
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
    List<Widget> buttons = [];
    ref.read(toolMapProvider).forEach((key, value) {
      buttons.add(
        Expanded(
          child: GestureDetector(
            onTap: () => ref
                .read(toolTypeSettingProvider.notifier)
                .changeCurrentTool(type: key),
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
      if (key != ToolType.favorite) {
        buttons.add(const SizedBox(width: 8)); // 간격 추가
      }
    });

    return buttons;
  }
}
