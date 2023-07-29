import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/screens/screens.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/episodes/widgets/episode_details.dart';

class ItemCard extends StatelessWidget {
  final EpisodeEntity episode;
  const ItemCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 390,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Card(
        elevation: 6,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episode.name ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Divider(
                  thickness: 0.25,
                ),
                CharacteristicItem(
                    icon: Icons.star_outline_rounded,
                    text: episode.episode ?? ''),
                CharacteristicItem(
                    icon: Icons.calendar_today_outlined,
                    text: episode.airDate ?? ''),
              ],
            ),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                    title: episode.name ?? '',
                    widget: EpisodeDetails(episode: episode)),
              )),
        ),
      ),
    );
  }
}
