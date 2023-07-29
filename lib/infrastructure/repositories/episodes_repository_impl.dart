import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class EpisodesRepositoryImpl implements EpisodesRepository {
  final EpisodesDatasource episodesDatasource;

  EpisodesRepositoryImpl({required this.episodesDatasource});

  @override
  Future<List<EpisodeEntity>> getEpisodesByPage(int page) =>
      episodesDatasource.getEpisodesByPage(page);

  @override
  Future<List<EpisodeEntity>> searchEpisodesByName(String name) =>
      episodesDatasource.searchEpisodesByName(name);
}
