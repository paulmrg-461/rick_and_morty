import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getCharacters();
  Future<List<CharacterEntity>> getCharactersByPage(int page);
}
