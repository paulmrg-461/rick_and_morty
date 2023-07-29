import 'package:flutter/material.dart';
import 'package:rick_and_morty/presentation/ui/views/views.dart';

class HomeProvider extends ChangeNotifier {
  String currentView = 'Characters';
  Widget selectedView = const CharactersView();

  Future<void> changeView(String view) async {
    currentView = view;
    switch (currentView) {
      case 'Characters':
        selectedView = const CharactersView();
      case 'Episodes':
        selectedView = const EpisodesView();
      case 'Locations':
        selectedView = const LocationsView();
    }
    notifyListeners();
  }
}
