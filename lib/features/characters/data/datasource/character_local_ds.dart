import '../../../../core/storage/boxes.dart';
import '../../../../core/storage/hive_service.dart';
import '../models/character_model.dart';
import '../models/edited_character_model.dart';

class CharacterLocalDataSource {
  /// Save characters list
  Future<void> cacheCharacters(List<CharacterModel> characters) async {
    final box = Boxes.getCharactersBox();

    for (var character in characters) {
      box.put(character.id, character.toJson());
    }
  }
  /// Save Character
  Future<void> saveCharacter(
      CharacterModel character) async {

    final box =
    HiveService.getCharacterBox();

    await box.put(
        character.id, character);
  }
  List<CharacterModel> getCachedCharacters() {
    final box = Boxes.getCharactersBox();

    final characters = box.values.map((json) {
      return CharacterModel.fromJson(Map<String, dynamic>.from(json));
    }).toList();

    return characters;
  }
/*  Future<List<CharacterModel>> getCachedCharacters() async {

    final box =
    HiveService.getCharacterBox();

    return box.values.toList();
  }*/
  Future<void> saveCharacters(
      List<CharacterModel> characters) async {

    final box =
    HiveService.getCharacterBox();

    final Map<int, CharacterModel> map = {
      for (var c in characters)
        c.id: c
    };

    await box.putAll(map);
  }
  /// Add Favorite
  void addFavorite(int id) {
    final box = Boxes.getFavoritesBox();

    box.put(id, true);
  }

  /// Remove Favorite
  void removeFavorite(int id) {
    final box = Boxes.getFavoritesBox();

    box.delete(id);
  }

  /// Check Favorite
  bool isFavorite(int id) {
    final box = Boxes.getFavoritesBox();

    return box.containsKey(id);
  }

  /// Get All Favorites
  List<int> getFavoriteIds() {
    final box = Boxes.getFavoritesBox();

    return box.keys.cast<int>().toList();
  }

  /// Save Edited Character
  void saveEditedCharacter(EditedCharacterModel edited) {
    final box = Boxes.getEditsBox();

    box.put(edited.id, edited.toJson());
  }

  EditedCharacterModel? getEditedCharacter(int id) {
    final box = Boxes.getEditsBox();

    final json = box.get(id);

    if (json == null) return null;

    return EditedCharacterModel.fromJson(Map<String, dynamic>.from(json));
  }

  CharacterModel mergeCharacterData(
    CharacterModel base,
    EditedCharacterModel? edit,
  ) {
    if (edit == null) return base;

    return base.copyWith(
      name: edit.name ?? base.name,
      status: edit.status ?? base.status,
      species: edit.species ?? base.species,
      type: edit.type ?? base.type,
      gender: edit.gender ?? base.gender,
      origin: base.origin.copyWith(name: edit.originName ?? base.origin.name),
      location: base.location.copyWith(
        name: edit.locationName ?? base.location.name,
      ),
    );
  }

}
