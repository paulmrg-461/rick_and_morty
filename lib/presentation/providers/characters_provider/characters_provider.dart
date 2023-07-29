import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/exceptions/api_exception.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class CharactersProvider extends ChangeNotifier {
  final CharactersRepository charactersRepository;
  CharactersProvider({required this.charactersRepository});

  int currentPage = 1;
  String errorMessage = '';
  bool initialLoading = true;
  List<CharacterEntity> characters = [];

  Future<void> getCharacters() async {
    try {
      final List<CharacterEntity> newCharacters =
          await charactersRepository.getCharactersByPage(currentPage);
      characters.addAll(newCharacters);
    } on ApiException catch (e) {
      errorMessage = e.message;
    }

    initialLoading = false;
    notifyListeners();
  }

  Future<List<CharacterEntity>> searchCharactersByName(String name) async {
    try {
      return await charactersRepository.searchCharactersByName(name);
    } on ApiException catch (e) {
      print(e);
    }
    return [];
  }

  void incrementCurrentPage() {
    currentPage++;
    getCharacters();
  }

  Future<void> reload() async {
    errorMessage = '';
    getCharacters();
  }
}
