import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/config/constants/environment.dart';
import 'package:rick_and_morty/core/exceptions/api_exception.dart';

class HttpAdapter {
  Future httpGet({required String uri, bool withBaseUrl = true}) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
            withBaseUrl ? '${Environment.rickAndMortyApiBaseUrl}/$uri' : uri),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw ApiException(
          statusCode: response.statusCode,
          message: 'Error to load REST API data: ${response.reasonPhrase}');
    } on TimeoutException catch (e) {
      throw ApiException(message: 'Error connection timeout: ${e.message}');
    } on SocketException catch (e) {
      throw ApiException(message: 'Socket error: ${e.message}');
    } on Error catch (e) {
      throw ApiException(message: 'General error: $e');
    }
  }
}
