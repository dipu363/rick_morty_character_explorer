import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/character_model.dart';
import '../../data/repository/character_repository.dart';
import 'character_providers.dart';

final noteProvider = Provider((ref) {
  final repo = ref.read(characterRepositoryProvider);

  return NoteNotifier(repo);
});

class NoteNotifier {
  final CharacterRepository repository;

  NoteNotifier(this.repository);

  Future<void> saveNote(CharacterModel character) async {
    await repository.saveNote(character);
  }
}
