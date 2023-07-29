import 'package:flutter/material.dart';

class CharactersRow extends StatelessWidget {
  final List<String> charactersImg;
  const CharactersRow({super.key, required this.charactersImg});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: charactersImg
              .map(
                (image) => CircleAvatar(
                  backgroundColor: colors.primary,
                  backgroundImage: NetworkImage(image),
                ),
                // Container(
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                //     margin: const EdgeInsets.only(bottom: 10, right: 8),
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(22),
                //       border: Border.all(color: colors.primary),
                //     ),
                //     child: Text(item,
                //         style: const TextStyle(
                //             fontSize: 14, fontWeight: FontWeight.w500)))
              )
              .toList()),
    );
  }
}
