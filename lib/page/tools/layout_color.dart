import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/color_palette.dart';
import 'package:maple_closet/providers/character_provider.dart';

class ColorLayout extends HookConsumerWidget {
  const ColorLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(characterProvider);
    final currentCharacter =
        ref.read(characterProvider.notifier).getCurrentCharacter();

    final hairColor1 = useState(currentCharacter.hairColor1);
    final hairColor2 = useState(currentCharacter.hairColor2);
    final lensColor1 = useState(currentCharacter.lensColor1);
    final lensColor2 = useState(currentCharacter.lensColor2);

    useEffect(() {
      hairColor1.value = currentCharacter.hairColor1;
      hairColor2.value = currentCharacter.hairColor2;
      lensColor1.value = currentCharacter.lensColor1;
      lensColor2.value = currentCharacter.lensColor2;
      return null;
    }, [currentCharacter]);

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 222, 218),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('헤어', style: TextStyle(fontSize: 15)),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xff2B3A55),
                        minimumSize: const Size(50, 35),
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () =>
                          ref.read(characterProvider.notifier).updateHairColor(
                                hairColor1: hairColor1.value,
                                hairColor2: hairColor2.value,
                              ),
                      child: Text(
                        '적용',
                        style: GoogleFonts.nanumMyeongjo(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: hairColorPalette.entries
                    .map(
                      (colorPick) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(colorPick.value[0]),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.width * 0.08),
                        ),
                        onPressed: () => hairColor1.value = colorPick.key,
                        child: hairColor1.value == colorPick.key
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: hairColorPalette.entries
                    .map(
                      (colorPick) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(colorPick.value[0]),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.width * 0.08),
                        ),
                        onPressed: () => hairColor2.value = colorPick.key,
                        child: hairColor2.value == colorPick.key
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 42),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('렌즈', style: TextStyle(fontSize: 15)),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xff2B3A55),
                        minimumSize: const Size(50, 35),
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () =>
                          ref.read(characterProvider.notifier).updateLensColor(
                                lensColor1: lensColor1.value,
                                lensColor2: lensColor2.value,
                              ),
                      child: Text(
                        '적용',
                        style: GoogleFonts.nanumMyeongjo(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: lensColorPalette.entries
                      .map(
                        (colorPick) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(colorPick.value[0]),
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.all(0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.08,
                                MediaQuery.of(context).size.width * 0.08),
                          ),
                          onPressed: () => lensColor1.value = colorPick.key,
                          child: lensColor1.value == colorPick.key
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      )
                      .toList()),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: lensColorPalette.entries
                    .map(
                      (colorPick) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(colorPick.value[0]),
                          minimumSize: Size.zero,
                          padding: const EdgeInsets.all(0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.08,
                              MediaQuery.of(context).size.width * 0.08),
                        ),
                        onPressed: () => lensColor2.value = colorPick.key,
                        child: lensColor2.value == colorPick.key
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
