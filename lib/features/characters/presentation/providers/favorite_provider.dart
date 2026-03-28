import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repository/character_repository.dart';
import 'character_providers.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, Set<int>>((
  ref,
) {
  final repository = ref.watch(characterRepositoryProvider);

  return FavoriteNotifier(repository);
});

class FavoriteNotifier extends StateNotifier<Set<int>> {
  final CharacterRepository repository;

  FavoriteNotifier(this.repository) : super({});

  void toggleFavorite(int id) {
    repository.toggleFavorite(id);

    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id};
    }
  }
}
