import 'package:flutter/material.dart';

class AvatarsRow extends StatelessWidget {
  final List<String> charactersImg;
  const AvatarsRow({super.key, required this.charactersImg});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 86,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: charactersImg.length,
          itemBuilder: (context, index) => Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(bottom: 10, left: 12),
                decoration: BoxDecoration(
                    color: colors.background,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.primary, width: 4),
                    image: DecorationImage(
                        image: NetworkImage('${charactersImg[index]}.jpeg'))),
              )),
    );
  }
}
