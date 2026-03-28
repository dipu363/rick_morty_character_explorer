import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/character_model.dart';
import '../providers/favorite_provider.dart';
import '../providers/note_provider.dart';

class CharacterDetailScreen extends ConsumerWidget {
  final CharacterModel character;

  const CharacterDetailScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites =
    ref.watch(favoriteProvider);

    final isFavorite =
    favorites.contains(character.id);

    final TextEditingController noteController =
    TextEditingController(
      text: character.note ?? "",
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),

        actions: [
          IconButton(
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red
                  : Colors.white,
            ),
            onPressed: () {
              ref
                  .read(favoriteProvider.notifier)
                  .toggleFavorite(character.id);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            /// Character Image
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage:
                NetworkImage(character.image),
              ),
            ),

            const SizedBox(height: 16),

            /// Name
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            /// Status
            Text(
              "Status: ${character.status}",
            ),

            /// Species
            Text(
              "Species: ${character.species}",
            ),

            /// Gender
            Text(
              "Gender: ${character.gender}",
            ),

            /// Origin
            Text(
              "Origin: ${character.origin.name}",
            ),

            /// Location
            Text(
              "Location: ${character.location.name}",
            ),

            const SizedBox(height: 20),

            /// Notes Section
            const Text(
              "Your Notes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: noteController,

              maxLines: 4,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write your notes...",
              ),
            ),

            const SizedBox(height: 12),

            /// Save Button
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                  onPressed: () async {

                    final updatedCharacter =
                    character.copyWith(
                      note: noteController.text,
                    );

                    await ref
                        .read(noteProvider)
                        .saveNote(updatedCharacter);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text("Note saved"),
                      ),
                    );
                  },
                child: const Text("Save Note"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}