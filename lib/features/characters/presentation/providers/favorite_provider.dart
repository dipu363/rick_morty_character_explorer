import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/storage/hive_service.dart';

final favoriteProvider = StateNotifierProvider<FavoriteNotifier, Set<int>>(
  (ref) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<Set<int>> {
  FavoriteNotifier() : super({}) {
    _loadFavorites();
  }

  void _loadFavorites() {
    final box = HiveService.getFavoriteBox();

    final ids = box.values.toSet();

    state = ids;
  }

  void toggleFavorite(int id) {
    final box = HiveService.getFavoriteBox();

    if (state.contains(id)) {
      box.delete(id);

      state = {...state}..remove(id);
    } else {
      box.put(id, id);

      state = {...state, id};
    }
  }
}
