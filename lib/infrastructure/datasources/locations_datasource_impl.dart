import 'package:rick_and_morty/core/helpers/http_adapter.dart';
import 'package:rick_and_morty/domain/datasources/datasources.dart';
import 'package:rick_and_morty/domain/entities/entities.dart';

class LocationsDatasourceImpl implements LocationsDatasource {
  final HttpAdapter httpAdapter = HttpAdapter();

  @override
  Future<List<LocationEntity>> getLocationsByPage(int page) async {
    final response = await httpAdapter.httpGet(uri: '/location/?page=$page');
    final List locations = response['results'] as List;
    return locations
        .map((location) => LocationEntity.fromJson(location))
        .toList();
  }
}
