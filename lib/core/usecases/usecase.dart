import 'package:dartz/dartz.dart';
import 'package:pokemon_project/core/erros/failure.dart';

// Project imports:
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {
  const NoParams._internal();
  @override
  String toString() => '()';
}

const NoParams emptyParams = NoParams._internal();
