import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/characters/widgets/characters_listview.dart';
import 'package:rick_and_morty/presentation/ui/views/episodes/widgets/episodes_listview.dart';

class SearchItemsDelegate extends SearchDelegate<dynamic> {
  final String currentView;

  SearchItemsDelegate(this.currentView);

  @override
  String get searchFieldLabel => 'Search by name';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          tooltip: 'Reset search',
          onPressed: () => query = '',
          icon: const Icon(Icons.close_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        tooltip: 'Close',
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) =>
      buildResultsAndSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) =>
      buildResultsAndSuggestions(context);

  FutureBuilder<List<dynamic>> buildResultsAndSuggestions(
      BuildContext context) {
    final CharactersProvider charactersProvider =
        Provider.of<CharactersProvider>(context);

    final EpisodesProvider episodesProvider =
        Provider.of<EpisodesProvider>(context);

    Future<List<dynamic>> future =
        charactersProvider.searchCharactersByName(query);

    switch (currentView) {
      case 'Characters':
        future = charactersProvider.searchCharactersByName(query);
        break;
      case 'Episodes':
        future = episodesProvider.searchEpisodesByName(query);
        break;
    }

    return FutureBuilder<List<dynamic>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: ErrorView(errorMessage: 'Search results were not found.'),
          );
        }

        if (snapshot.hasData) {
          final List<dynamic> items = snapshot.data ?? [];
          Widget resultsListView = Container();

          switch (currentView) {
            case 'Characters':
              resultsListView = CharactersListview(
                  characters: items as List<CharacterEntity>);
              break;
            case 'Episodes':
              resultsListView =
                  EpisodesListview(episodes: items as List<EpisodeEntity>);
              break;
          }

          return items.isEmpty
              ? const Center(
                  child:
                      ErrorView(errorMessage: 'Search results were not found.'),
                )
              : resultsListView;
        }

        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
