import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/character_model.dart';
import '../providers/favorite_provider.dart';
import '../screens/character_detail_screen.dart';

class CharacterCard extends ConsumerWidget {
  final CharacterModel character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    final isFavorite = favorites.contains(character.id);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(character.image)),

        title: Text(
          character.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        subtitle: Text("${character.species} • ${character.status}"),

        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            ref.read(favoriteProvider.notifier).toggleFavorite(character.id);
          },
        ),

          onTap: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    CharacterDetailScreen(
                      character: character,
                    ),
              ),
            );

          }
      ),
    );
  }
}
