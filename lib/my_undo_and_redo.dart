import 'package:flutter/material.dart';

class UndoAndRedo extends StatefulWidget {
  final Function() undoImage;
  final Function() redoImage;
  const UndoAndRedo(
      {super.key, required this.undoImage, required this.redoImage});

  @override
  State<StatefulWidget> createState() {
    return _UndoAndRedo();
  }
}

class _UndoAndRedo extends State<UndoAndRedo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FilledButton(
          onPressed: widget.undoImage,
          style: FilledButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.all(0),
              fixedSize: Size(47, 35),
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
          onPressed: widget.redoImage,
          style: FilledButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.all(0),
            fixedSize: Size(47, 35),
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
