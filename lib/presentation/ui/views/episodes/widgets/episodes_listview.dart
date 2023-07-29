import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/views/episodes/widgets/item_card.dart';

class EpisodesListview extends StatelessWidget {
  final List<EpisodeEntity> episodes;
  const EpisodesListview({super.key, required this.episodes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        final EpisodeEntity episode = episodes[index];
        return ItemCard(episode: episode);
      },
    );
  }
}
