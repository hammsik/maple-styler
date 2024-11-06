import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class CharacterBoard extends HookConsumerWidget {
  final double height;
  final Future? characterImage;

  const CharacterBoard({
    super.key,
    required this.height,
    this.characterImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentBackgroundType = ref.watch(backgroundSettingProvider);
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
      if (currentBackgroundType == BackgroundType.basic) {
        animationController.reset();
        animationController.forward();
        currentClickedItemIdx.value = ref.read(imageSettingProvider);
      }
      return null;
    }, [currentBackgroundType]);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: currentBackgroundType == BackgroundType.basic
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: const Color.fromARGB(255, 230, 222, 218),
                          child: FutureBuilder(
                            future: characterImage,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.memory(
                                      snapshot.data[0],
                                      fit: BoxFit.none,
                                    ),
                                    Opacity(
                                      opacity: 0.5,
                                      child: Image.memory(
                                        snapshot.data[1],
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Image.asset(
                                    'assets/drummingBunny.gif'); // 로딩 중일 때 표시할 위젯
                              }
                            },
                          ),
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
                                      .read(imageSettingProvider.notifier)
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
          : ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                fit: BoxFit.fitHeight,
                backgroundMap[currentBackgroundType]![1],
              ),
            ),
    );
  }
}
