import 'package:pokemon_project/core/erros/exception.dart';
import 'package:pokemon_project/features/pokemon_list/data/base/pokemon_data_source.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon_project/core/erros/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_project/features/pokemon_list/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>> fetchList() async {
    try {
      final remoteResponse = await remoteDataSource.index();
      return remoteResponse.isNotEmpty
          ? right(remoteResponse)
          : left(EmptyFailure());
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
