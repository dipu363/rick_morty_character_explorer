import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

class HiveService {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(Boxes.characters);
    await Hive.openBox(Boxes.favorites);
    await Hive.openBox(Boxes.edits);
  }
}