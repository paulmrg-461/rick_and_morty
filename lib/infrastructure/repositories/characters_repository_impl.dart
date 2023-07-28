import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDatasource charactersDatasource;

  CharactersRepositoryImpl(this.charactersDatasource);

  @override
  Future<List<CharacterEntity>> getCharacters() =>
      charactersDatasource.getCharacters();

  @override
  Future<List<CharacterEntity>> getCharactersByPage(int page) =>
      charactersDatasource.getCharactersByPage(page);
}
