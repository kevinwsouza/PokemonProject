import 'package:pokemon_project/core/client/pokemon_project_response.dart';

abstract class PokemonProjectClient {
  Future<PokemonProjectResponse> get(
    String path, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
  Future<PokemonProjectResponse> post(
    String path, {
    Map<String, String> headers,
    Map<String, dynamic> body,
  });

  Future<PokemonProjectResponse> put(
    String path, {
    Map<String, String> headers,
    Map<String, dynamic> body,
  });
  Future<PokemonProjectResponse> delete(
    String path, {
    Map<String, String> headers,
    Map<String, dynamic> body,
  });
}
