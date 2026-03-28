import '../datasource/character_local_ds.dart';
import '../datasource/character_remote_ds.dart';
import '../models/character_model.dart';
import '../models/edited_character_model.dart';

class CharacterRepository {
  final CharacterRemoteDataSource remote;
  final CharacterLocalDataSource local;

  CharacterRepository({required this.remote, required this.local});

  Future<List<CharacterModel>> fetchCharacters(int page) async {
    try {
      /// Fetch from API
      final response = await remote.fetchCharacters(page);

      /// Cache API data
      await local.cacheCharacters(response.results);

      /// Merge edited data
      final merged = _mergeCharacterList(response.results);

      return merged;
    } catch (e) {
      /// Offline fallback
      final cached = local.getCachedCharacters();

      final merged = _mergeCharacterList(cached);

      return merged;
    }
  }

  List<CharacterModel> _mergeCharacterList(List<CharacterModel> list) {
    return list.map((character) {
      final edit = local.getEditedCharacter(character.id);

      return local.mergeCharacterData(character, edit);
    }).toList();
  }

  void toggleFavorite(int id) {
    if (local.isFavorite(id)) {
      local.removeFavorite(id);
    } else {
      local.addFavorite(id);
    }
  }

  bool isFavorite(int id) {
    return local.isFavorite(id);
  }

  List<CharacterModel> getFavoriteCharacters() {
    final favoriteIds = local.getFavoriteIds();

    final cached = local.getCachedCharacters();

    return cached.where((c) => favoriteIds.contains(c.id)).toList();
  }

  void saveEditedCharacter(EditedCharacterModel edited) {
    local.saveEditedCharacter(edited);
  }
}
