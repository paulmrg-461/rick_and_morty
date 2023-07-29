import 'package:rick_and_morty/domain/entities/entities.dart';

abstract class LocationsDatasource {
  Future<List<LocationEntity>> getLocationsByPage(int page);
  Future<List<LocationEntity>> searchLocationsByName(String name);
}
