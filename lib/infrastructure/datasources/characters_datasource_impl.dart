import 'package:rick_and_morty/core/helpers/http_adapter.dart';
import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/character_entity.dart';

class CharactersDatasourceImpl implements CharactersDatasource {
  final HttpAdapter httpAdapter = HttpAdapter();
  final int itemsPerPage = 10;

  @override
  Future<List<CharacterEntity>> getCharacters() async {
    final List response = await httpAdapter.httpGet(uri: '/character') as List;
    return response
        .map((character) => CharacterEntity.fromJson(character))
        .toList();
  }

  @override
  Future<List<CharacterEntity>> getCharactersByPage(int page) async {
    final List response =
        await httpAdapter.httpGet(uri: '/character/?page=$page') as List;
    return response
        .map((character) => CharacterEntity.fromJson(character))
        .toList();
  }
}
