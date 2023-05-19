import 'package:pokemon_project/core/client/pokemon_project_client.dart';
import 'package:pokemon_project/core/erros/exception.dart';
import 'package:pokemon_project/features/pokemon_list/data/base/pokemon_data_source.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonDataSourceImpl implements PokemonDataSource {
  final PokemonProjectClient client;

  PokemonDataSourceImpl({required this.client});

  @override
  Future<List<Pokemon>> index() async {
    final response = await client.get('https://pokeapi.co/api/v2/pokemon');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      final pokemonList = jsonData['results'] as List<dynamic>?;

      if (pokemonList != null) {
        final pokemonDetailsFutures = pokemonList.map((pokemonData) async {
          final name = pokemonData['name'];
          final url = pokemonData['url'];

          final pokemonDetailsResponse = await client.get(url);
          final pokemonJsonData = pokemonDetailsResponse.data;
          final String frontDefault =
              pokemonJsonData['sprites']['front_default'];
          List<dynamic> abilities = pokemonJsonData['abilities']
              .map((abilityData) => abilityData['ability']['name'] as String)
              .toList();
          List<dynamic> type = pokemonJsonData['types']
              .map((typeData) => typeData['type']['name'] as String)
              .toList();
          final int height = pokemonJsonData['height'];
          final int id = pokemonJsonData['id'];
          final int weight = pokemonJsonData['weight'];

          return Pokemon(
            ability: abilities,
            type: type,
            height: height,
            id: id,
            name: name,
            weight: weight,
            frontDefault: frontDefault,
          );
        });

        return Future.wait(pokemonDetailsFutures.toList());
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else if (response.statusCode == 403) {
        throw ForbiddenException();
      } else {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
