import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/edited_character_model.dart';
import '../../data/repository/character_repository.dart';
import 'character_providers.dart';

final editProvider = Provider<EditNotifier>((ref) {
  final repository = ref.watch(characterRepositoryProvider);

  return EditNotifier(repository);
});

class EditNotifier {
  final CharacterRepository repository;

  EditNotifier(this.repository);

  void saveEdit(EditedCharacterModel edited) {
    repository.saveEditedCharacter(edited);
  }

}
