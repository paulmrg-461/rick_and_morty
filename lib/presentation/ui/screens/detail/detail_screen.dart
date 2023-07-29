import 'package:flutter/material.dart';
import 'package:rick_and_morty/config/constants/environment.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';

class DetailScreen extends StatelessWidget {
  final CharacterEntity character;
  const DetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? ''),
        actions: [
          IconButton(
              tooltip: 'Developer information',
              onPressed: () => Navigator.pushNamed(context, 'developer'),
              icon: const Icon(Icons.info_outline_rounded)),
        ],
      ),
      body: Column(
        children: [
          NetworkImg(
            url: character.image ?? Environment.notFoundImage,
            height: size.height * 0.6,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacteristicItem(
                      icon: Icons.south_america,
                      text: 'Location: ${character.location?.name}',
                      isBigger: true,
                    ),
                    CharacteristicItem(
                      icon: character.gender == 'Male'
                          ? Icons.male
                          : Icons.female,
                      text: 'Gender: ${character.gender}',
                      isBigger: true,
                    ),
                    CharacteristicItem(
                      icon: Icons.monitor_heart_outlined,
                      text: 'Status: ${character.status}',
                      isBigger: true,
                    ),
                    CharacteristicItem(
                      icon: Icons.accessibility_new_rounded,
                      text: 'Specie: ${character.species}',
                      isBigger: true,
                    ),
                    CharacteristicItem(
                      icon: Icons.account_box_outlined,
                      text: 'Type: ${character.type}',
                      isBigger: true,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
