import 'package:flutter/material.dart';

class FavoriteLayout extends StatefulWidget {
  const FavoriteLayout({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteLayout();
  }
}

class _FavoriteLayout extends State<FavoriteLayout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 222, 218),
                  minimumSize: Size(0, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Text('아이템'),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 230, 222, 218),
                  minimumSize: Size(0, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {},
                child: Text('캐릭터'),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 222, 218),
              borderRadius: BorderRadius.circular(12),
            ),
            child: null,
          ),
        ),
      ],
    );
  }
}
