import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class EpisodesDatasource {
  Future<List<EpisodeEntity>> getEpisodesByPage(int page);
  Future<List<EpisodeEntity>> searchEpisodesByName(String name);
}
