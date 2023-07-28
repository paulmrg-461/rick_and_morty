import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';
import 'package:rick_and_morty/domain/repositories/repositories.dart';

class LocationsRepositoryImpl implements LocationsRepository {
  final LocationsDatasource locationsDatasource;

  LocationsRepositoryImpl({required this.locationsDatasource});

  @override
  Future<List<LocationEntity>> getLocationsByPage(int page) =>
      locationsDatasource.getLocationsByPage(page);
}
