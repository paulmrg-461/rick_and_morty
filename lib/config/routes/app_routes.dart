import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/ui/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
  };
}
