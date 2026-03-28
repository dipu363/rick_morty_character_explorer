import 'package:hive/hive.dart';

class Boxes {
  static const String characters = 'charactersBox';
  static const String favorites = 'favorites';
  static const String edits = 'editsBox';

  static Box getCharactersBox() =>
      Hive.box(characters);

  static Box getFavoritesBox() =>
      Hive.box(favorites);

  static Box getEditsBox() =>
      Hive.box(edits);
}