import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/views/locations/widgets/item_card.dart';

class LocationsListview extends StatelessWidget {
  final List<LocationEntity> locations;
  const LocationsListview({super.key, required this.locations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final LocationEntity location = locations[index];
        return ItemCard(location: location);
      },
    );
  }
}
