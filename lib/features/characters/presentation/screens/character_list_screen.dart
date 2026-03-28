import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../providers/character_providers.dart';
import '../widgets/character_card.dart';

class CharacterListScreen extends ConsumerStatefulWidget {
  const CharacterListScreen({super.key});

  @override
  ConsumerState<CharacterListScreen> createState() =>
      _CharacterListScreenState();
}

class _CharacterListScreenState extends ConsumerState<CharacterListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    /// Load first page
    Future.microtask(() {
      ref.read(characterListProvider.notifier).fetchNextPage();
    });

    /// Pagination listener
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(characterListProvider.notifier).fetchNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(characterListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick & Morty Characters"),
        centerTitle: true,
      ),

      body: characters.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,

              itemCount: characters.length + 1,

              itemBuilder: (context, index) {
                /// Loader at bottom
                if (index == characters.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final character = characters[index];

                return CharacterCard(character: character);
              },
            ),
    );
  }
}
