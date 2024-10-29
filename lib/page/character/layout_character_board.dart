import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class CharacterBoard extends ConsumerWidget {
  final double height;

  const CharacterBoard({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBackgroundType = ref.watch(backgroundSettingProvider);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: currentBackgroundType == BackgroundType.basic ? 
        Container(
          color: const Color.fromARGB(255, 230, 222, 218),
        ) : Image.asset(
        fit: BoxFit.fitHeight,
        backgroundMap[currentBackgroundType]![1],
      ),
      ),
    );
  }
}
