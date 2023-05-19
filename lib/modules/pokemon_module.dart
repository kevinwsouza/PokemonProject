import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_project/features/pokemon_list/data/base/pokemon_data_source.dart';
import 'package:pokemon_project/features/pokemon_list/data/datasources/pokemon_data_source_impl.dart';
import 'package:pokemon_project/features/pokemon_list/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_project/features/pokemon_list/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_project/features/pokemon_list/domain/usecases/fetch_pokemon_list.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/store/pokemon_store.dart';

class PokemonModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<PokemonDataSource>(
            (i) => PokemonDataSourceImpl(client: i()),
            export: true),
        Bind.factory<PokemonRepository>(
            (i) => PokemonRepositoryImpl(remoteDataSource: i()),
            export: true),
        Bind.factory<FetchPokemonList>((i) => FetchPokemonList(repository: i()),
            export: true),
        Bind.factory<PokemonStore>((i) => PokemonStore(fetchPokemonList: i()),
            export: true),
      ];
}
