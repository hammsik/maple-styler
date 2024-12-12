import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/providers/character_provider.dart';

class UndoAndRedo extends ConsumerWidget {
  const UndoAndRedo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        FilledButton(
          onPressed: () {
            // undoImage();
            ref.read(characterProvider.notifier).undo();
          },
          style: FilledButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.all(0),
              fixedSize: const Size(47, 35),
              foregroundColor: Colors.black.withOpacity(0.4),
              backgroundColor: const Color.fromARGB(255, 230, 222, 218),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
          child: const Icon(
            Icons.undo_rounded,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
        FilledButton(
          onPressed: () {
            // redoImage();
            ref.read(characterProvider.notifier).redo();
          },
          style: FilledButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.all(0),
            fixedSize: const Size(47, 35),
            foregroundColor: Colors.black.withOpacity(0.4),
            backgroundColor: const Color.fromARGB(255, 230, 222, 218),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Icon(
            Icons.redo_rounded,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
