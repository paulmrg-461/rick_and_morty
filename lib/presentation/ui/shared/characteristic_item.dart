import 'package:flutter/material.dart';

class CharacteristicItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBigger;
  const CharacteristicItem(
      {super.key,
      required this.icon,
      required this.text,
      this.isBigger = false});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          size: isBigger ? 28 : 18,
          color: colors.primary,
        ),
        SizedBox(
          width: isBigger ? 12 : 4,
        ),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: isBigger ? 16 : 14, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
