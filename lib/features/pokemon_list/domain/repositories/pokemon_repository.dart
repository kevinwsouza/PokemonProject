import 'package:dartz/dartz.dart';
import 'package:pokemon_project/core/erros/failure.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> fetchList();
}
