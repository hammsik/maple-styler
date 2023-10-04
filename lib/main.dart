import 'package:flutter/material.dart';
import 'package:maple_closet/layout_mapbuttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This is a cordinate app for MapleStory, the \"Maple Closet\"",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              MapButtonLayout(),
            ],
          ),
        ),
      ),
    );
  }
}
