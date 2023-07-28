import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';
import 'package:rick_and_morty/presentation/ui/views/views.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of(context);
    final bool isDarkMode = themeProvider.isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty'),
        actions: [
          IconButton(
              tooltip: isDarkMode ? 'Set light theme' : 'Set dark theme',
              onPressed: () => themeProvider.toggleDarkMode(),
              icon: isDarkMode
                  ? const Icon(Icons.light_mode_outlined)
                  : const Icon(Icons.dark_mode_outlined)),
          IconButton(
              tooltip: 'Search',
              onPressed: () {},
              icon: const Icon(Icons.search_outlined)),
        ],
      ),
      body: const LocationsView(),
    );
  }
}
