import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final Widget widget;
  const DetailScreen({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                tooltip: 'Developer information',
                onPressed: () => Navigator.pushNamed(context, 'developer'),
                icon: const Icon(Icons.info_outline_rounded)),
          ],
        ),
        body: widget);
  }
}
