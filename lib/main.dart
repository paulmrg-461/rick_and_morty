import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/routes/app_routes.dart';
import 'package:rick_and_morty/infrastructure/datasources/datasources.dart';
import 'package:rick_and_morty/infrastructure/repositories/repositories.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';

void main() async {
  final CharactersRepositoryImpl charactersRepositoryImpl =
      CharactersRepositoryImpl(
          charactersDatasource: CharactersDatasourceImpl());

  final EpisodesRepositoryImpl episodesRepositoryImpl =
      EpisodesRepositoryImpl(episodesDatasource: EpisodesDatasourceImpl());

  final LocationsRepositoryImpl locationsRepositoryImpl =
      LocationsRepositoryImpl(locationsDatasource: LocationsDatasourceImpl());

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode: false)),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(
        lazy: false,
        create: (_) =>
            CharactersProvider(charactersRepository: charactersRepositoryImpl)
              ..getCharacters()),
    ChangeNotifierProvider(
        lazy: false,
        create: (_) =>
            EpisodesProvider(episodesRepository: episodesRepositoryImpl)
              ..getEpisodes()),
    ChangeNotifierProvider(
        lazy: false,
        create: (_) =>
            LocationsProvider(locationsRepository: locationsRepositoryImpl)
              ..getLocations()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
        title: 'Rick & Morty App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
        theme: themeProvider.getTheme());
  }
}
