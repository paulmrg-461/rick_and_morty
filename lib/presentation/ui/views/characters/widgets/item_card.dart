import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/constants/environment.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/characters/widgets/characteristic_item.dart';

class ItemCard extends StatelessWidget {
  final CharacterEntity character;
  const ItemCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Card(
        elevation: 6,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          child: Column(
            children: [
              Expanded(
                  child: NetworkImg(
                      url: character.image ?? Environment.notFoundImage)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    CharacteristicItem(
                        icon: Icons.south_america,
                        text: character.location?.name ?? ''),
                    const Divider(
                      thickness: 0.25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CharacteristicItem(
                            icon: character.gender == 'Male'
                                ? Icons.male
                                : Icons.female,
                            text: character.gender ?? ''),
                        CharacteristicItem(
                            icon: Icons.monitor_heart,
                            text: 'Status: ${character.status}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
