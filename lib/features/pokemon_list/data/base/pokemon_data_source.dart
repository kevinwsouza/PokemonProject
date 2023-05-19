import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';

abstract class PokemonDataSource {
  Future<List<Pokemon>> index();
}
