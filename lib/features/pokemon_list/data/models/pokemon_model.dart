import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  const PokemonModel({
    required List<dynamic> abilities,
    required List<dynamic> type,
    required int height,
    required int id,
    required String name,
    required int weight,
    required String frontDefault,
  }) : super(
          ability: abilities,
          type: type,
          height: height,
          id: id,
          name: name,
          weight: weight,
          frontDefault: frontDefault,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      abilities: (json['abilities'] as List<dynamic>)
          .map((abilityData) => abilityData['ability']['name'] as String)
          .toList(),
      type: (json['types'] as List<dynamic>)
          .map((typeData) => typeData['type']['name'] as String)
          .toList(),
      height: json['height'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      weight: json['weight'] ?? 0,
      frontDefault: json['frontDefault'] ?? '',
    );
  }
}
