import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/page/character/layout_character_info.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/providers/toast_provider.dart';

class CharacterBoard extends HookConsumerWidget {
  final double height;

  const CharacterBoard({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final background = ref.watch(backgroundSettingProvider);
    final ValueNotifier<ActionType> currentClickedItemIdx =
        useState(ActionType.stand1);

    // AnimationController 생성
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 400),
    );

    // CurvedAnimation 생성
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeOutQuart);

    final sizeAnimation = Tween<Size>(
      begin: Size(MediaQuery.sizeOf(context).width, height),
      end: Size(MediaQuery.sizeOf(context).width - 140, height),
    ).animate(curvedAnimation);

    useEffect(() {
      if (background == BackgroundType.basic) {
        animationController.reset();
        animationController.forward();
        currentClickedItemIdx.value = ref.read(actionSettingProvider);
      }
      return null;
    }, [background]);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: background == BackgroundType.basic
          ? Row(
              children: [
                Stack(
                  children: [
                    AnimatedBuilder(
                  animation: sizeAnimation,
                  builder: (context, child) {
                    // 애니메이션 begin(화면 전체 너비)이 좌우 패딩(40)+버튼 간격(10)을
                    // 넘어 순간적으로 Row 오버플로우가 나므로 사용 가능 폭으로 clamp한다.
                    final double maxWidth =
                        MediaQuery.sizeOf(context).width - 52;
                    return SizedBox(
                      width: sizeAnimation.value.width
                          .clamp(0.0, maxWidth)
                          .toDouble(),
                      height: sizeAnimation.value.height,
                      child: child,
                    );
                  },
                  child: Animate(
                      effects: [
                        FadeEffect(
                          curve: Curves.easeInQuint,
                          duration: 200.ms,
                        )
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 230, 222, 218),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: const CharacterImage(),
                        ),
                      )),
                    ),
                    const Positioned(
                      bottom: 8,
                      right: 8,
                      child: WeaponModeToggle(),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: actionMap.entries
                          .map(
                            (type) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Colors.black.withOpacity(0.3),
                                  side: currentClickedItemIdx.value == type.key
                                      ? const BorderSide(
                                          width: 3,
                                          color: Color.fromARGB(
                                              255, 181, 103, 103),
                                        )
                                      : null,
                                  backgroundColor:
                                      currentClickedItemIdx.value == type.key
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 230, 222, 218),
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  fixedSize: const Size(
                                    double.infinity,
                                    40,
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  currentClickedItemIdx.value = type.key;
                                  ref
                                      .read(actionSettingProvider.notifier)
                                      .changeActionType(type.key);
                                },
                                child: Stack(
                                  fit: StackFit.expand,
                                  alignment: Alignment.center,
                                  children: [
                                    if (type.key
                                        .toString()
                                        .split(".")[1]
                                        .startsWith("_"))
                                      const Positioned(
                                        top: 2,
                                        right: 6,
                                        child: Text(
                                          "GIF",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 128, 128, 128),
                                          ),
                                        ),
                                      ),
                                    Center(
                                      child: Text(
                                        type.value,
                                        style: TextStyle(fontFamily: 'Maplestory', 
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList()
                          .animate(delay: 150.ms, interval: 50.ms)
                          .fadeIn(curve: Curves.easeInQuint, duration: 150.ms)
                          .moveX(
                            begin: 50,
                            curve: Curves.easeOutQuart,
                            duration: 300.ms,
                          ),
                    ),
                  ),
                ),
              ],
            )
          : const Stack(
              fit: StackFit.expand,
              children: [
                BackgroundImage(),
                CharacterImage(),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: WeaponModeToggle(),
                ),
              ],
            ),
    );
  }
}

class CharacterImage extends ConsumerWidget {
  const CharacterImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(characterProvider);
    ref.watch(actionSettingProvider);
    // 무기 모드(한손 stand1 / 두손 stand2)가 바뀌면 캐릭터를 다시 렌더한다.
    ref.watch(weaponModeProvider);
    final characterImageList =
        ref.read(characterProvider.notifier).getCurrentCharacterImageAsUint();

    return FutureBuilder(
      future: characterImageList, // 이미지를 불러오는 Future
      builder: (context, snapshot) {
        // API 응답이 지연(타임아웃)되면 안내 토스트를 띄운다.
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError &&
            snapshot.error is TimeoutException) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!context.mounted) return;
            ref.read(customToastProvider.notifier).showCustomToast(
                  context,
                  type: ToastType.error,
                  message: '캐릭터 생성이 지연되고 있습니다. 잠시 후 다시 시도해주세요.',
                );
          });
          return Image.asset('assets/drummingBunny.gif');
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Stack(
            fit: StackFit.passthrough,
            children: [
              Image.memory(
                snapshot.data![0],
                fit: BoxFit.none,
              ),
              Opacity(
                opacity: 0.5,
                child: Image.memory(
                  snapshot.data![1],
                  fit: BoxFit.none,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    splashColor: Colors.black.withOpacity(0.2),
                    onTap: () => Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const CharacterDetail(),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            opaque: false,
                          ),
                        )),
              ),
            ],
          );
        } else {
          return Image.asset('assets/drummingBunny.gif'); // 로딩 중일 때 표시할 위젯
        }
      },
    );
  }
}

/// 캐릭터 캔버스 우측 하단의 무기 장착 모드 토글.
/// stand1(한손·기본) <-> stand2(두손). 기본값은 한손(stand1).
class WeaponModeToggle extends ConsumerWidget {
  const WeaponModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(weaponModeProvider);
    final bool isTwoHanded = mode == WeaponModeType.twoHanded;

    const accent = Color.fromARGB(255, 181, 103, 103);
    const surface = Color.fromARGB(255, 245, 240, 237);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => ref.read(weaponModeProvider.notifier).changeMode(
              isTwoHanded ? WeaponModeType.oneHanded : WeaponModeType.twoHanded,
            ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isTwoHanded ? accent : surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.swap_horiz_rounded,
                size: 16,
                color: isTwoHanded ? Colors.white : accent,
              ),
              const SizedBox(width: 4),
              Text(
                isTwoHanded ? '두손' : '한손',
                style: TextStyle(fontFamily: 'Maplestory', 
                  color: isTwoHanded ? Colors.white : Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBackgroundType = ref.watch(backgroundSettingProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: MediaQuery.of(context).size.height < 600
          ? Transform.scale(
              scale: 1.14, // 1.05배 확대
              alignment: Alignment.topCenter, // 하단 정렬
              child: Image.asset(
                backgroundMap[currentBackgroundType]![1],
                fit: BoxFit.cover, // 컨테이너를 꽉 채우도록
                width: double.infinity,
                height: double.infinity,
              ),
            )
          : Image.asset(
              fit: BoxFit.cover,
              backgroundMap[currentBackgroundType]![1],
            ),
    );
  }
}
