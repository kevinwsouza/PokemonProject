import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/screens/Details_Screen.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/widgets/pokemon_list_item.dart';

class PokemonListView extends StatelessWidget {
  final List<Pokemon> pokemonEntity;

  const PokemonListView({
    Key? key,
    required this.pokemonEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pokemonEntity.length,
      itemBuilder: (context, index) {
        final pokemonCard = pokemonEntity[index];
        return PokemonListItem(
            pokemonEntity: pokemonCard,
            onTap: () {
              Modular.to.pushNamed('pokemon-details',
                  arguments: PokemonDetailsArgs(pokemon: pokemonCard));
            });
      },
    );
  }
}
