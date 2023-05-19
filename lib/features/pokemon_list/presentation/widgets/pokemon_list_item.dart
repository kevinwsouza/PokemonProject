import 'package:flutter/material.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemonEntity;
  final VoidCallback onTap;

  const PokemonListItem(
      {Key? key, required this.pokemonEntity, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Text(pokemonEntity.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  Image.network(
                    pokemonEntity.frontDefault,
                    width: 200,
                    height: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
