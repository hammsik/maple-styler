import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class MapButton extends ConsumerWidget {
  final BackgroundType backgroundType;

  const MapButton({
    super.key,
    required this.backgroundType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget mapIcon;

    if (backgroundType == BackgroundType.basic) {
      mapIcon = Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
      );
    } else {
      mapIcon = Image.asset(
        fit: BoxFit.cover,
        backgroundMap[backgroundType]![0],
      );
    }

    final currentBackgroundType = ref.watch(backgroundSettingProvider);

    return Animate(
      target: currentBackgroundType == backgroundType ? 1 : 0,
      effects: [
        MoveEffect(
            end: const Offset(0, -12),
            curve: currentBackgroundType == backgroundType
                ? Curves.easeOutBack
                : Curves.easeInQuint),
        const TintEffect(
          color: Colors.black,
          begin: 0.42,
          curve: Curves.easeInOut,
        ),
      ],
      child: GestureDetector(
        onTap: () => ref
            .read(backgroundSettingProvider.notifier)
            .changeBackground(type: backgroundType),
        child: Container(
          width: 55,
          height: 32,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 36, 36, 36).withOpacity(0.4),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: const Color.fromARGB(255, 38, 38, 38), width: 0.2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: mapIcon,
          ),
        ),
      ),
    );
  }
}
