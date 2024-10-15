import 'dart:collection';

import 'package:maple_closet/models/equipment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'character_queue_provider.g.dart';

@Riverpod(keepAlive: true)
class CharacterQueue extends _$CharacterQueue {
  @override
  Queue<Equipment> build() {
    return Queue();
  }
}
