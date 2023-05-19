import 'package:pokemon_project/core/erros/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_project/core/usecases/usecase.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon_project/features/pokemon_list/domain/repositories/pokemon_repository.dart';

class FetchPokemonList extends UseCase<List<Pokemon>, NoParams> {
  final PokemonRepository repository;

  FetchPokemonList({required this.repository});

  @override
  Future<Either<Failure, List<Pokemon>>> call(NoParams params) {
    return repository.fetchList();
  }
}
