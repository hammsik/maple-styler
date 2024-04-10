import 'package:flutter/material.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/maple_styler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // deleteDatabase('user.db');
  runApp(const MapleStyler());
}

class MapleStyler extends StatelessWidget {
  const MapleStyler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Maple Closet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapleStylerHome(),
    );
  }
}
