import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/store/pokemon_store.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/widgets/pokemon_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final PokemonStore store = Modular.get<PokemonStore>();
  @override
  void initState() {
    store.loadPokemonList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon App'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(builder: (context) {
            return PokemonListView(pokemonEntity: store.pokemonList);
          }),
        ));
  }
}
