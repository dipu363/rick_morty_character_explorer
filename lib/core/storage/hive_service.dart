
import 'package:hive_flutter/hive_flutter.dart';
import '../../features/characters/data/models/character_model.dart';
import '../../features/characters/data/models/edited_character_model.dart';
import '../../features/characters/data/models/location_model.dart';
import '../../features/characters/data/models/origin_model.dart';
import 'boxes.dart';
class HiveService {

  static const String characterBoxName =
      "characters";

  static const String favoriteBoxName =
      "favorites";

  static const String editedBoxName =
      "editedCharacters"; // ✅ NEW

  static Future<void> init() async {

    await Hive.initFlutter();

    /// Register Adapters
    Hive.registerAdapter(
        OriginModelAdapter());

    Hive.registerAdapter(
        LocationModelAdapter());

    Hive.registerAdapter(
        CharacterModelAdapter());

    Hive.registerAdapter(
        EditedCharacterModelAdapter());
    await Hive.openBox<CharacterModel>(Boxes.characters);
    await Hive.openBox<int>(Boxes.favorites);
    await Hive.openBox<EditedCharacterModel>(Boxes.edits);

    print("Hive Initialized Successfully ");
  }

  /// Character Box
  static Box<CharacterModel>
  getCharacterBox() {

    return Hive.box<CharacterModel>(
        characterBoxName);
  }

  /// Favorite Box
  static Box<int> getFavoriteBox() {

    return Hive.box<int>(
        favoriteBoxName);
  }

  /// Edited Box
  static Box<EditedCharacterModel>
  getEditedBox() {

    return Hive.box<EditedCharacterModel>(
        editedBoxName);
  }
}