import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class LocationsRepository {
  Future<List<LocationEntity>> getLocationsByPage(int page);
}
