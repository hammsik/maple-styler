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
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: const Icon(
            Icons.info_outlined,
            color: Color(0xfff2f2f2),
            size: 24,
          ),
        ),
        Text(
          "MAPLE STYLER",
          style: GoogleFonts.nanumMyeongjo(
            color: const Color(0xfff2f2f2),
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: widget.clickEvent,
          child: const Icon(
            Icons.account_box,
            color: Color(0xfff2f2f2),
            size: 24,
          ),
        ),
      ],
    );
  }
}
