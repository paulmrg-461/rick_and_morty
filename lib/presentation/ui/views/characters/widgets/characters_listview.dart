import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';
import 'package:rick_and_morty/presentation/ui/views/characters/widgets/item_card.dart';

class CharactersListview extends StatelessWidget {
  final List<CharacterEntity> characters;
  const CharactersListview({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        final CharacterEntity character = characters[index];
        return ItemCard(character: character);
      },
    );
  }
}
