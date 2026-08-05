import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gal/gal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/data/backgrounds.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';
import 'package:maple_closet/providers/toast_provider.dart';

/// 캐릭터 이미지를 배경과 함께 캡처해 사진 앨범에 저장하는 바텀시트를 띄운다.
Future<void> showImageSaveSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color.fromARGB(255, 245, 240, 237),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => const _ImageSaveSheet(),
  );
}

class _ImageSaveSheet extends HookConsumerWidget {
  const _ImageSaveSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previewKey = useMemoized(() => GlobalKey());
    final selectedBg = useState(BackgroundType.basic);
    final isSaving = useState(false);
    // 이미지 비율 (높이 고정, 너비 가변). 버튼 탭 시 순환.
    const ratios = <List<int>>[
      [1, 1],
      [3, 4],
      [4, 3],
    ];
    final ratioIdx = useState(0);
    final ratio = ratios[ratioIdx.value];

    // 저장용 정적 포즈(무기 모드는 getCurrentCharacterURL에서 반영됨)
    final imagesFuture = useMemoized(
      () => ref
          .read(characterProvider.notifier)
          .getCurrentCharacterImageAsUint(at: ActionType.stand1),
    );
    final snapshot = useFuture(imagesFuture);
    final images = snapshot.data;

    Future<void> handleSave() async {
      if (images == null || isSaving.value) return;
      isSaving.value = true;
      try {
        // 워터마크 픽셀 폰트가 로드된 뒤 캡처하도록 보장
        await GoogleFonts.pendingFonts([GoogleFonts.pressStart2p()]);
        await WidgetsBinding.instance.endOfFrame;

        final boundary = previewKey.currentContext!.findRenderObject()
            as RenderRepaintBoundary;
        final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        final byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        final Uint8List bytes = byteData!.buffer.asUint8List();

        final bool hasAccess =
            await Gal.hasAccess() || await Gal.requestAccess();
        if (!hasAccess) {
          if (context.mounted) {
            ref.read(customToastProvider.notifier).showCustomToast(context,
                type: ToastType.error, message: '사진 접근 권한이 필요합니다.');
          }
          return;
        }

        await Gal.putImageBytes(bytes,
            name: 'maple_styler_${DateTime.now().millisecondsSinceEpoch}');

        if (context.mounted) {
          ref.read(customToastProvider.notifier).showCustomToast(context,
              type: ToastType.success, message: '이미지가 앨범에 저장되었습니다.');
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          ref.read(customToastProvider.notifier).showCustomToast(context,
              type: ToastType.error, message: '저장에 실패했습니다.');
        }
      } finally {
        isSaving.value = false;
      }
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('이미지 저장',
                  style: TextStyle(fontFamily: 'Maplestory', 
                      fontSize: 16, fontWeight: FontWeight.w800)),
            ),
            const SizedBox(height: 16),

            // 미리보기 (캡처 대상)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: RepaintBoundary(
                  key: previewKey,
                  child: _CapturePreview(
                    background: selectedBg.value,
                    images: images,
                    ratioW: ratio[0],
                    ratioH: ratio[1],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 배경 선택
            Text('배경 선택',
                style: TextStyle(fontFamily: 'Maplestory', 
                    fontSize: 12, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            SizedBox(
              height: 54,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: BackgroundType.values
                    .map((bg) => _BackgroundChip(
                          type: bg,
                          isSelected: selectedBg.value == bg,
                          onTap: () => selectedBg.value = bg,
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),

            // 저장 버튼 + 비율 순환 버튼(우측)
            SizedBox(
              height: 48,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ElevatedButton(
                onPressed: images == null || isSaving.value ? null : handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 181, 103, 103),
                  disabledBackgroundColor:
                      const Color.fromARGB(255, 210, 190, 190),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: isSaving.value
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.download_rounded,
                              color: Colors.white, size: 20),
                          const SizedBox(width: 8),
                          Text('앨범에 저장',
                              style: TextStyle(fontFamily: 'Maplestory', 
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _RatioButton(
                    label: '${ratio[0]}:${ratio[1]}',
                    onTap: () =>
                        ratioIdx.value = (ratioIdx.value + 1) % ratios.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 캡처되는 실제 이미지 영역: 배경 + 캐릭터 + 워터마크.
class _CapturePreview extends StatelessWidget {
  final BackgroundType background;
  final List<Uint8List>? images;
  final int ratioW;
  final int ratioH;

  const _CapturePreview({
    required this.background,
    required this.images,
    required this.ratioW,
    required this.ratioH,
  });

  @override
  Widget build(BuildContext context) {
    // 높이는 고정(기존 정사각형 한 변), 너비만 비율에 따라 변한다.
    final double height = MediaQuery.of(context).size.width * 0.6;
    final double width = height * ratioW / ratioH;
    final bgPaths = backgroundMap[background];

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 배경 (캐릭터 지면과 맞추기 위해 y축으로 10 내림.
          // cover로 꽉 찬 상태라 상단 빈틈을 막으려 살짝 확대 후 이동)
          if (background == BackgroundType.basic || bgPaths == null)
            Container(color: const Color.fromARGB(255, 230, 222, 218))
          else
            Transform.translate(
              offset: const Offset(0, 7),
              child: Transform.scale(
                scale: 1.08,
                child: Image.asset(bgPaths[1], fit: BoxFit.cover),
              ),
            ),

          // 캐릭터 (중앙, 확대)
          if (images != null)
            Center(
              child: Transform.scale(
                scale: 1.45,
                alignment: const Alignment(0, -0.15),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.memory(images![0], fit: BoxFit.none),
                    Opacity(
                      opacity: 0.5,
                      child: Image.memory(images![1], fit: BoxFit.none),
                    ),
                  ],
                ),
              ),
            )
          else
            const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),

          // 워터마크 (우측 하단, 픽셀 폰트, opacity 0.7)
          Positioned(
            right: 8,
            bottom: 7,
            child: Opacity(
              opacity: 0.7,
              child: Text(
                'MAPLE\nSTYLER',
                textAlign: TextAlign.right,
                style: GoogleFonts.pressStart2p(
                  fontSize: 6,
                  height: 1.5,
                  color: Colors.white,
                  shadows: const [
                    Shadow(
                        color: Colors.black54,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatioButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _RatioButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 222, 218),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.aspect_ratio_rounded,
                size: 18, color: Color.fromARGB(255, 181, 103, 103)),
            const SizedBox(width: 6),
            Text(label,
                style: TextStyle(fontFamily: 'Maplestory', 
                    fontSize: 13, fontWeight: FontWeight.w800)),
          ],
        ),
      ),
    );
  }
}

class _BackgroundChip extends StatelessWidget {
  final BackgroundType type;
  final bool isSelected;
  final VoidCallback onTap;

  const _BackgroundChip({
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgPaths = backgroundMap[type];
    const accent = Color.fromARGB(255, 181, 103, 103);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? accent : Colors.transparent,
            width: 2.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: (type == BackgroundType.basic || bgPaths == null)
              ? Container(
                  color: const Color.fromARGB(255, 230, 222, 218),
                  alignment: Alignment.center,
                  child: Text('기본',
                      style: TextStyle(fontFamily: 'Maplestory', 
                          fontSize: 10, fontWeight: FontWeight.w700)),
                )
              : Image.asset(bgPaths[0], fit: BoxFit.cover),
        ),
      ),
    );
  }
}
