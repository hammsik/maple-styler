import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCustomAppBar extends StatefulWidget {
  final Function() clickEvent;

  const MyCustomAppBar({super.key, required this.clickEvent});

  @override
  State<StatefulWidget> createState() {
    return _MyCustomAppBar();
  }
}

class _MyCustomAppBar extends State<MyCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "MAPLE STYLER",
            style: GoogleFonts.nanumMyeongjo(
              color: const Color(0xfff2f2f2),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
