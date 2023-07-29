import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/exceptions/api_exception.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class EpisodesProvider extends ChangeNotifier {
  final EpisodesRepository episodesRepository;
  EpisodesProvider({required this.episodesRepository});

  int currentPage = 1;
  String errorMessage = '';
  bool initialLoading = true;
  List<EpisodeEntity> episodes = [];

  Future<void> getEpisodes() async {
    try {
      final List<EpisodeEntity> newEpisodes =
          await episodesRepository.getEpisodesByPage(currentPage);
      episodes.addAll(newEpisodes);
    } on ApiException catch (e) {
      errorMessage = e.message;
    }

    initialLoading = false;
    notifyListeners();
  }

  Future<List<EpisodeEntity>> searchEpisodesByName(String name) async {
    try {
      return await episodesRepository.searchEpisodesByName(name);
    } on ApiException catch (e) {
      print(e);
    }
    return [];
  }

  void incrementCurrentPage() {
    currentPage++;
    getEpisodes();
  }

  Future<void> reload() async {
    errorMessage = '';
    currentPage = 1;
    getEpisodes();
  }
}
