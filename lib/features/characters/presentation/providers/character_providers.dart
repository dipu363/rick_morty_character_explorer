import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_service.dart';
import '../../data/datasource/character_remote_ds.dart';
import '../../data/datasource/character_local_ds.dart';
import '../../data/repository/character_repository.dart';
import '../../data/models/character_model.dart';

/// API Service
final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

/// Remote Data Source
final remoteDataSourceProvider = Provider<CharacterRemoteDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);

  return CharacterRemoteDataSource(apiService: apiService);
});

/// Local Data Source
final localDataSourceProvider = Provider<CharacterLocalDataSource>((ref) {
  return CharacterLocalDataSource();
});

/// Repository
final characterRepositoryProvider = Provider<CharacterRepository>((ref) {
  final remote = ref.watch(remoteDataSourceProvider);

  final local = ref.watch(localDataSourceProvider);

  return CharacterRepository(remote: remote, local: local);
});

final characterListProvider =
StateNotifierProvider<
    CharacterListNotifier,
    List<CharacterModel>>((ref) {

  final repository =
  ref.watch(characterRepositoryProvider);

  return CharacterListNotifier(repository);

});

class CharacterListNotifier extends StateNotifier<List<CharacterModel>> {
  final CharacterRepository repository;

  CharacterListNotifier(this.repository) : super([]);

  int _page = 1;

  bool isLoading = false;

  bool hasMore = true;

  Future<void> fetchNextPage() async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    try {
      final newCharacters = await repository.fetchCharacters(_page);

      if (newCharacters.isEmpty) {
        hasMore = false;
      } else {
        state = [...state, ...newCharacters];

        _page++;
      }
    } catch (e) {
      print("Pagination Error: $e");
    }

    isLoading = false;
  }





}
