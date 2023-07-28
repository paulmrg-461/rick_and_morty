import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/exceptions/api_exception.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class CharactersProvider extends ChangeNotifier {
  final CharactersRepository charactersRepository;
  CharactersProvider({required this.charactersRepository});

  String errorMessage = '';
  bool initialLoading = true;
  List<CharacterEntity> characters = [];

  Future<void> getCharacters() async {
    try {
      characters = await charactersRepository.getCharacters();
    } on ApiException catch (e) {
      errorMessage = e.message;
    }

    initialLoading = false;
    notifyListeners();
  }
}
