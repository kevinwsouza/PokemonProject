import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:simple_rich_text/simple_rich_text.dart';

class DetailsScreen extends StatelessWidget {
  final PokemonDetailsArgs args;

  const DetailsScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.decimalPattern();

    return Scaffold(
      appBar: AppBar(
        title: Text(args.pokemon.name),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleRichText('*id:* ${args.pokemon.id}',
                style: const TextStyle(fontSize: 18, color: Colors.black)),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(height: 16),
            Image.network(
              args.pokemon.frontDefault,
              width: 250,
              height: 250,
            ),
            const SizedBox(height: 16),
            SimpleRichText(
              '*Ability:* ${args.pokemon.ability.join(", ")}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(
              height: 15,
            ),
            SimpleRichText(
              '*Types:* ${args.pokemon.type.join(", ")}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 15),
            SimpleRichText(
              '*Height:* ${formatter.format(args.pokemon.height / 10)} m',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 15),
            SimpleRichText(
              '*Weight:* ${formatter.format(args.pokemon.weight / 10)} kg',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonDetailsArgs {
  final Pokemon pokemon;

  PokemonDetailsArgs({required this.pokemon});
}
