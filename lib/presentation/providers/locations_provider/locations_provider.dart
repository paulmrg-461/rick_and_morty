import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/exceptions/api_exception.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class LocationsProvider extends ChangeNotifier {
  final LocationsRepository locationsRepository;
  LocationsProvider({required this.locationsRepository});

  int currentPage = 1;
  String errorMessage = '';
  bool initialLoading = true;
  List<LocationEntity> locations = [];

  Future<void> getLocations() async {
    try {
      final List<LocationEntity> newLocations =
          await locationsRepository.getLocationsByPage(currentPage);
      locations.addAll(newLocations);
    } on ApiException catch (e) {
      if (e.message != 'Error to load REST API data: Not Found') {
        errorMessage = e.message;
      }
    }

    initialLoading = false;
    notifyListeners();
  }

  Future<List<LocationEntity>> searchLocationsByName(String name) async {
    try {
      return await locationsRepository.searchLocationsByName(name);
    } on ApiException catch (e) {
      print(e);
    }
    return [];
  }

  void incrementCurrentPage() {
    currentPage++;
    getLocations();
  }

  Future<void> reload() async {
    errorMessage = '';
    currentPage = 1;
    getLocations();
  }
}
