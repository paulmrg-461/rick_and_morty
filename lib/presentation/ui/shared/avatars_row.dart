import 'package:flutter/material.dart';

class AvatarsRow extends StatelessWidget {
  final List<String> charactersImg;
  const AvatarsRow({super.key, required this.charactersImg});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: charactersImg
              .map((image) => Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(bottom: 10, left: 12),
                    decoration: BoxDecoration(
                        color: colors.background,
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.primary, width: 4),
                        image: DecorationImage(
                            image: NetworkImage('$image.jpeg'))),
                  ))
              .toList()),
    );
  }
}
