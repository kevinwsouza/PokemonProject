import 'package:dio/dio.dart' as dio;
import 'package:pokemon_project/core/client/pokemon_project_client.dart';
import 'package:pokemon_project/core/client/pokemon_project_response.dart';

class PokemonProjectDioClientImpl implements PokemonProjectClient {
  final dio.Dio client;
  final String url;

  PokemonProjectDioClientImpl({required this.client, required this.url});

  @override
  Future<PokemonProjectResponse> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.delete(path,
        data: body,
        options: dio.Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 499),
        ));

    return PokemonProjectResponse.fromDioResponse(response);
  }

  @override
  Future<PokemonProjectResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(path,
        queryParameters: query,
        options: dio.Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 499),
        ));
    return PokemonProjectResponse.fromDioResponse(response);
  }

  @override
  Future<PokemonProjectResponse> post(
    String path, {
    Map<String, String>? headers = const <String, String>{},
    Map<String, dynamic>? body = const <String, String>{},
  }) async {
    final response = await client.post(path,
        data: body,
        options: dio.Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status >= 200 && status <= 499),
        ));
    return PokemonProjectResponse.fromDioResponse(response);
  }

  @override
  Future<PokemonProjectResponse> put(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final response = await client.put(
      path,
      data: body,
      options: dio.Options(
        headers: headers,
        validateStatus: (status) =>
            status != null && (status >= 200 && status <= 499),
      ),
    );
    return PokemonProjectResponse.fromDioResponse(response);
  }
}
