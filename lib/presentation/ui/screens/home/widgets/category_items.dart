import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/shared/shared.dart';

class CategoryItems extends StatelessWidget {
  const CategoryItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          Item(
            icon: Icons.person_outline,
            title: 'Characters',
          ),
          Item(
            icon: Icons.tv_rounded,
            title: 'Episodes',
          ),
          Item(
            icon: Icons.south_america_rounded,
            title: 'Locations',
          ),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String title;
  const Item({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(
        left: 6,
      ),
      child: homeProvider.currentView == title
          ? FilledButton.icon(
              onPressed: () {},
              icon: Icon(icon),
              label: Text(title),
            )
          : OutlinedButton.icon(
              onPressed: () => homeProvider.changeView(title),
              label: Text(title),
              icon: Icon(icon)),
    );

    // return Container(
    //   margin: const EdgeInsets.only(
    //     left: 6,
    //   ),
    //   child: Card(
    //     elevation: 1,
    //     semanticContainer: true,
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     child: InkWell(
    //       child: Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    //           child: CharacteristicItem(icon: icon, text: title)),
    //       onTap: () {},
    //     ),
    //   ),
    // );
  }
}
