import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:maple_closet/providers/setting_provider.dart';

// 스타일 상수 정의
class ToolButtonStyles {
  static const activeColor = Color.fromARGB(255, 181, 103, 103);
  static const inactiveColor = Color.fromARGB(255, 230, 222, 218);
  static const activeTextColor = Colors.white;
  static const inactiveTextColor = Colors.black;
  static const double buttonHeight = 35;
  static const double buttonRadius = 8;
  static const double spaceBetweenButtons = 8;
}

class MytoolButtons extends ConsumerWidget {
  final MyTool currentTool;

  const MytoolButtons({
    required this.currentTool,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: _buildToolButtonsWithGap(ref),
    );
  }

  List<Widget> _buildToolButtonsWithGap(WidgetRef ref) {
    final toolMap = ref.read(toolMapProvider);
    List<Widget> buttons = [];
    
    // 모든 도구를 순회하며 버튼 생성
    toolMap.forEach((toolType, tool) {
      // 버튼 추가
      buttons.add(
        Expanded(
          child: ToolButton(
            toolType: toolType,
            tool: tool,
            isActive: currentTool.toolType == tool.toolType,
          ),
        ),
      );
      
      // 마지막 아이템이 아니면 간격 추가
      if (toolType != ToolType.favorite) {
        buttons.add(const SizedBox(width: ToolButtonStyles.spaceBetweenButtons));
      }
    });

    return buttons;
  }
}

// 개별 버튼 위젯으로 분리
class ToolButton extends ConsumerWidget {
  final ToolType toolType;
  final MyTool tool;
  final bool isActive;

  const ToolButton({
    required this.toolType,
    required this.tool,
    required this.isActive,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ref
          .read(toolTypeSettingProvider.notifier)
          .changeCurrentTool(type: toolType),
      child: Container(
        alignment: Alignment.center,
        height: ToolButtonStyles.buttonHeight,
        decoration: BoxDecoration(
          color: isActive 
              ? ToolButtonStyles.activeColor
              : ToolButtonStyles.inactiveColor,
          borderRadius: BorderRadius.circular(ToolButtonStyles.buttonRadius),
        ),
        child: _buildButtonContent(),
      ),
    );
  }
  
  // 버튼 내용 생성 메서드
  Widget _buildButtonContent() {
    if (toolType == ToolType.favorite) {
      return Icon(
        Icons.favorite_rounded,
        color: isActive
            ? ToolButtonStyles.inactiveColor
            : ToolButtonStyles.activeColor,
      );
    }
    
    return Text(
      tool.toolNameKo,
      style: TextStyle(
        color: isActive
            ? ToolButtonStyles.activeTextColor
            : ToolButtonStyles.inactiveTextColor,
      ),
    );
  }
}
