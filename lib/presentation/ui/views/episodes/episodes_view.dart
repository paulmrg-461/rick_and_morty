import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/episodes/widgets/episodes_listview.dart';

class EpisodesView extends StatelessWidget {
  const EpisodesView({super.key});

  @override
  Widget build(BuildContext context) {
    final EpisodesProvider episodesProvider = context.watch<EpisodesProvider>();
    return episodesProvider.initialLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : (episodesProvider.errorMessage == '')
            ? NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      scrollNotification.metrics.extentAfter == 0) {
                    episodesProvider.incrementCurrentPage();
                  }
                  return true;
                },
                child: EpisodesListview(episodes: episodesProvider.episodes))
            : ErrorView(
                errorMessage: episodesProvider.errorMessage,
                callback: () => episodesProvider.reload(),
              );
  }
}
