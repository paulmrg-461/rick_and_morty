import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';

class EpisodeDetails extends StatelessWidget {
  final EpisodeEntity episode;
  const EpisodeDetails({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAssetImage(path: 'assets/icons/rick-and-morty.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                CharacteristicItem(
                  icon: Icons.star_outline_rounded,
                  text: 'Episode: ${episode.episode}',
                  isBigger: true,
                ),
                CharacteristicItem(
                  icon: Icons.calendar_month,
                  text: 'Air date: ${episode.airDate}',
                  isBigger: true,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    thickness: 0.75,
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      'Characters',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AvatarsRow(charactersImg: episode.characters ?? []),
        ],
      ),
    );
  }
}
