import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? callback;
  const ErrorView({super.key, required this.errorMessage, this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/not_found404.png'))),
          ),
          Text(errorMessage),
          TextButton.icon(
              onPressed: callback,
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'))
        ],
      ),
    );
  }
}
