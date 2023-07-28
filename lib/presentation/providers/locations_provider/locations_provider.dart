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
      errorMessage = e.message;
    }

    initialLoading = false;
    notifyListeners();
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
