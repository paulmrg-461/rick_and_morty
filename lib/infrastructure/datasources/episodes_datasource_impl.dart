import 'package:rick_and_morty/core/helpers/http_adapter.dart';
import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';

class EpisodesDatasourceImpl implements EpisodesDatasource {
  final HttpAdapter httpAdapter = HttpAdapter();

  @override
  Future<List<EpisodeEntity>> getEpisodesByPage(int page) async {
    final response = await httpAdapter.httpGet(uri: '/episode/?page=$page');
    final List episodes = response['results'] as List;
    return episodes.map((episode) => EpisodeEntity.fromJson(episode)).toList();
  }

  @override
  Future<List<EpisodeEntity>> searchEpisodesByName(String name) async {
    final response = await httpAdapter.httpGet(uri: '/episode/?name=$name');
    final List episodes = response['results'] as List;
    return episodes.map((episode) => EpisodeEntity.fromJson(episode)).toList();
  }
}
