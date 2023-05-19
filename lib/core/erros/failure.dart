import 'package:equatable/equatable.dart';

abstract class Failure {
  final List<dynamic>? properties;

  Failure({this.properties});
}

class ServerFailure extends Failure implements EquatableMixin {
  @override
  String toString() => 'Server  Failure';

  @override
  List<Object?> get props => [properties];

  @override
  bool? get stringify => throw UnimplementedError();
}

class EmptyFailure extends Failure implements EquatableMixin {
  @override
  String toString() => 'Server  Failure';

  @override
  List<Object?> get props => [properties];

  @override
  bool? get stringify => throw UnimplementedError();
}

class UnauthorizedFailure extends Failure implements EquatableMixin {
  @override
  String toString() => 'Unauthorized Failure';

  @override
  List<Object?> get props => [properties];

  @override
  bool? get stringify => throw UnimplementedError();
}

class ForbiddenFailure extends Failure implements EquatableMixin {
  @override
  String toString() => 'Forbidden Failure';

  @override
  List<Object?> get props => [properties];

  @override
  bool? get stringify => throw UnimplementedError();
}
