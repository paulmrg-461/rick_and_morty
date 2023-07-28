import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/characters/widgets/cards_listview.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    final CharactersProvider charactersProvider =
        context.watch<CharactersProvider>();
    return charactersProvider.initialLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : (charactersProvider.errorMessage == '')
            ? NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      scrollNotification.metrics.extentAfter == 0) {
                    charactersProvider.incrementCurrentPage();
                  }
                  return true;
                },
                child: CardsListview(characters: charactersProvider.characters))
            : ErrorView(
                errorMessage: charactersProvider.errorMessage,
                callback: () => charactersProvider.reload(),
              );
  }
}
