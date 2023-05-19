import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final List<dynamic> ability;
  final List<dynamic> type;
  final int height;
  final int id;
  final String name;
  final int weight;
  final String frontDefault;

  const Pokemon({
    required this.ability,
    required this.type,
    required this.height,
    required this.id,
    required this.name,
    required this.weight,
    required this.frontDefault,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
