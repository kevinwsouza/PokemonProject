import 'package:mobx/mobx.dart';
import 'package:pokemon_project/core/erros/failure.dart';
import 'package:pokemon_project/core/usecases/usecase.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon_project/features/pokemon_list/domain/usecases/fetch_pokemon_list.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final FetchPokemonList fetchPokemonList;

  _PokemonStoreBase({required this.fetchPokemonList});

  @observable
  List<Pokemon> pokemonList = [];

  @observable
  int selectedIndex = 0;

  @action
  void setPokemonList(List<Pokemon> value) => pokemonList = value;

  @computed
  Pokemon? get selectedPokemon =>
      pokemonList.isNotEmpty && selectedIndex < pokemonList.length
          ? pokemonList[selectedIndex]
          : null;

  Future<void> loadPokemonList() async {
    final result = await fetchPokemonList(emptyParams);
    result.fold((failure) {
      if (failure is ServerFailure) {
        'Falha na Requisição';
      } else if (failure is UnauthorizedFailure) {
        'Não Autorizado';
      } else if (failure is ForbiddenFailure) {
        'Acesso Negado';
      }
    }, (pokemonList) => setPokemonList(pokemonList));
  }
}
