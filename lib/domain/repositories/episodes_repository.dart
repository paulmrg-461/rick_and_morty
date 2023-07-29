import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class EpisodesRepository {
  Future<List<EpisodeEntity>> getEpisodesByPage(int page);
  Future<List<EpisodeEntity>> searchEpisodesByName(String name);
}
