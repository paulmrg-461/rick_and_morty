import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/locations/widgets/cards_listview.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationsProvider locationsProvider =
        context.watch<LocationsProvider>();
    return locationsProvider.initialLoading
        ? const Center(child: CircularProgressIndicator.adaptive())
        : (locationsProvider.errorMessage == '')
            ? NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      scrollNotification.metrics.extentAfter == 0) {
                    locationsProvider.incrementCurrentPage();
                  }
                  return true;
                },
                child: CardsListview(locations: locationsProvider.locations))
            : ErrorView(
                errorMessage: locationsProvider.errorMessage,
                callback: () => locationsProvider.reload(),
              );
  }
}
