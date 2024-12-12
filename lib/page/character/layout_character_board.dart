import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/page/character/layout_character_info.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';

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
                AnimatedBuilder(
                  animation: sizeAnimation,
                  builder: (context, child) {
                    return SizedBox(
                      width: sizeAnimation.value.width,
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
                                        style: GoogleFonts.nanumMyeongjo(
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
    final characterImageList =
        ref.read(characterProvider.notifier).getCurrentCharacterImageAsUint();

    return FutureBuilder(
      future: characterImageList, // 이미지를 불러오는 Future
      builder: (context, snapshot) {
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

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBackgroundType = ref.watch(backgroundSettingProvider);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        fit: BoxFit.fitHeight,
        backgroundMap[currentBackgroundType]![1],
      ),
    );
  }
}
