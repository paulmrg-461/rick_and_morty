import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class CharactersRepository {
  Future<List<CharacterEntity>> getCharactersByPage(int page);
  Future<List<CharacterEntity>> searchCharactersByName(String name);
}
