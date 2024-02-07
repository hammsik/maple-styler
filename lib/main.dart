import 'package:flutter/material.dart';
import 'package:maple_closet/database/database.dart';
import 'package:maple_closet/maple_styler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // deleteDatabase('item.db');
  runApp(const MapleStyler());
}
