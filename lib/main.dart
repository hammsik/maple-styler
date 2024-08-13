import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/page/maple_styler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // deleteDatabase('user.db');
  runApp(const ProviderScope(child: MapleStyler()));
}

class MapleStyler extends StatelessWidget {
  const MapleStyler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapleStylerHome(),
    );
  }
}
