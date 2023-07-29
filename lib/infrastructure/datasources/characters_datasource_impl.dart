import 'package:rick_and_morty/core/helpers/http_adapter.dart';
import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';

class CharactersDatasourceImpl implements CharactersDatasource {
  final HttpAdapter httpAdapter = HttpAdapter();

  @override
  Future<List<CharacterEntity>> getCharactersByPage(int page) async {
    final response = await httpAdapter.httpGet(uri: '/character/?page=$page');
    final List characters = response['results'] as List;
    return characters
        .map((character) => CharacterEntity.fromJson(character))
        .toList();
  }

  @override
  Future<List<CharacterEntity>> searchCharactersByName(String name) async {
    final response = await httpAdapter.httpGet(uri: '/character/?name=$name');
    final List characters = response['results'] as List;
    return characters
        .map((character) => CharacterEntity.fromJson(character))
        .toList();
  }
}
