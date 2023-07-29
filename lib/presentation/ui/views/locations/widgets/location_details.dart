import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';

class LocationDetails extends StatelessWidget {
  final LocationEntity location;
  const LocationDetails({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                const CustomAssetImage(path: 'assets/icons/rick-and-morty.png'),
                CharacteristicItem(
                  icon: Icons.star_outline_rounded,
                  text: 'Type: ${location.type}',
                  isBigger: true,
                ),
                CharacteristicItem(
                  icon: Icons.south_america_outlined,
                  text: location.dimension ?? '',
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
          AvatarsRow(charactersImg: location.residents ?? []),
        ],
      ),
    );
  }
}
