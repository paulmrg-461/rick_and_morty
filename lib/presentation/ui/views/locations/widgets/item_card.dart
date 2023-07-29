import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/screens/screens.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';
import 'package:rick_and_morty/presentation/ui/views/locations/widgets/location_details.dart';

class ItemCard extends StatelessWidget {
  final LocationEntity location;
  const ItemCard({super.key, required this.location});

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
                  location.name ?? '',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Divider(
                  thickness: 0.25,
                ),
                CharacteristicItem(
                    icon: Icons.star_outline_rounded,
                    text: location.type ?? ''),
                CharacteristicItem(
                    icon: Icons.south_america_outlined,
                    text: location.dimension ?? ''),
              ],
            ),
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                    title: location.name ?? '',
                    widget: LocationDetails(location: location)),
              )),
        ),
      ),
    );
  }
}
