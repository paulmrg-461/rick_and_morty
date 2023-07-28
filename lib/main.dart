import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/routes/app_routes.dart';
import 'package:rick_and_morty/presentation/providers/providers.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider(isDarkMode: false)),
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
