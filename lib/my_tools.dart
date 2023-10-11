import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> toolList = ['뷰티', '코디', '악세', '염색', '다운', '문의'];

class MyTools extends StatefulWidget {
  MyTools({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyTools();
  }
}

class _MyTools extends State<MyTools> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...toolList.map(
          (item) => GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 47,
              height: 35,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 208, 208, 208),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                item,
                style: GoogleFonts.nanumMyeongjo(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
